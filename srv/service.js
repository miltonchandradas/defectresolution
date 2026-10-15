import cds from '@sap/cds';
import { executeHttpRequest } from '@sap-cloud-sdk/http-client';
import { OrchestrationClient } from '@sap-ai-sdk/orchestration';
import { readFile } from 'node:fs/promises';
import { randomUUID } from 'node:crypto';
import path from 'node:path';
import { emailDocxAttachmentsViaDestination } from './utils/notifications.js';
import { uploadBufferToObjectStore } from './utils/objectstore.js';

const LOG = cds.log('defectresolution');
const SOLMAN_DESTINATION_NAME = 'Solman_Prod';
const LLM_MODEL_NAME = String(process.env.LLM_MODEL_NAME || 'gpt-5.5').trim();
const RESOURCE_GROUP = String(process.env.RESOURCE_GROUP || 'default').trim();
const S4_DESTINATION_NAME = String(process.env.S4_DESTINATION_NAME || 'S4X_AI').trim();
const ZGW_AI_SRV_PATH = String(process.env.ZGW_AI_SRV_PATH || '/sap/opu/odata/sap/ZGW_AI_SRV').trim();
const MAX_TOKENS = Number.parseInt(String(process.env.MAX_TOKENS || '100000'), 10);
const MAX_ATTACHMENT_TEXT_CHARS = Number.parseInt(String(process.env.MAX_ATTACHMENT_TEXT_CHARS || '4000'), 10);
const STARTUP_DEFECT_IDS = parseStartupDefectIds(
  process.env.STARTUP_DEFECT_IDS ?? '8000197596'
);

const orchestrationClient = createOrchestrationClient();
let parseDefectPromptTemplate;
let defectResolutionPromptTemplate;

export default cds.service.impl(async function () {
  const { DefectHeader, DefectNotes } = this.entities;

  cds.spawn({ after: 30000 }, async () => {
    if (!STARTUP_DEFECT_IDS.length) {
      LOG.warn('Startup defect fetch skipped because no defect IDs are configured');
      return;
    }

    for (const startupDefectId of STARTUP_DEFECT_IDS) {
      await processDefectForOrchestration(startupDefectId, 'S1DM', 'Startup');
    }
  });

  this.on('triggerDefectOrchestration', async (req) => {
    const defectIdsInput =
      req.data?.defectIds ??
      req.data?.DefectIds ??
      req.data?.ids ??
      req.data?.Ids ??
      '';

    const processType = String(req.data?.processType || req.data?.ProcessType || 'S1DM').trim() || 'S1DM';
    const defectIds = parseStartupDefectIds(defectIdsInput);

    if (!defectIds.length) {
      req.reject(400, 'Provide defectIds as a comma-separated string.');
      return;
    }

    const config = parseReviewConfig(req.data);
    const client = createOrchestrationClient(config);
    const requestId = req.id;
    req.on('succeeded', () => {
      const job = cds.spawn({ after: 0 }, async () => {
        for (const defectId of defectIds) {
          const result = await processDefectForOrchestration(defectId, processType, 'On-demand', {
            client,
            recipients: config.recipients,
          });
          LOG.info('Background defect orchestration completed', {
            requestId,
            defectId,
            status: result.status,
            error: result.error,
          });
        }
      });
      job.on('failed', (error) => {
        LOG.error('Background defect orchestration failed', {
          requestId,
          ...extractHttpErrorDetails(error),
        });
      });
    });

    return defectIds.map((defectId) => ({
      defectId,
      guid: '',
      typeId: processType,
      status: 'SUBMITTED',
      notesCount: 0,
      attachmentCount: 0,
      llmResponse: '',
      analysisResponse: '',
      error: '',
    }));
  });

  this.on('READ', DefectHeader, async (req) => {
    const params = Array.isArray(req.params) ? req.params[0] : req.params ?? {};
    const defectId =
      params?.id ??
      params?.Id ??
      req.data?.id ??
      req.data?.Id ??
      req._queryOptions?.id ??
      req._queryOptions?.Id ??
      req._queryOptions?.defectId ??
      req._queryOptions?.DefectId ??
      extractFilterValue(req, 'id') ??
      extractFilterValue(req, 'Id');

    const typeId ='S1DM';

    if (!defectId) {
      return [];
    }

    const defect = await fetchSolmanDefectDetails(defectId, typeId);

    return defect ? [{
      guid: defect.Guid,
      id: defect.Id,
      typeId: defect.TypeId ?? typeId,
      reporter: defect.Reporter,
      status: defect.Status,
      createdAt: defect.CreatedAt,
      changedAt: defect.ChangedAt,
    }] : [];
  });

  this.on('READ', DefectNotes, async (req) => {
    const params = Array.isArray(req.params) ? req.params[0] : req.params ?? {};
    const guid =
      params?.guid ??
      params?.Guid ??
      req.data?.guid ??
      req.data?.Guid ??
      req._queryOptions?.guid ??
      req._queryOptions?.Guid ??
      extractFilterValue(req, 'guid') ??
      extractFilterValue(req, 'Guid');

    const processType =
      params?.processType ??
      params?.ProcessType ??
      req.data?.processType ??
      req.data?.ProcessType ??
      req._queryOptions?.processType ??
      req._queryOptions?.ProcessType ??
      extractFilterValue(req, 'processType') ??
      extractFilterValue(req, 'ProcessType') ??
      'S1DM';

    if (!guid) {
      return [];
    }

    const notes = await fetchSolmanNotesByGuid(guid, processType);

    return notes.map((note) => ({
      guid: note.WsGuid,
      textType: note.TextType,
      textTypeId: note.TextTypeId,
      textDate: note.TextDate,
      textSender: note.TextSender,
      textValue: note.TextValue,
    }));
  });
});

async function fetchSolmanDefectDetails(defectId, typeId = 'S1DM') {
  const trimmedDefectId = String(defectId || '').trim();

  if (!trimmedDefectId) {
    return null;
  }

  const defectLookupUrl =
    `/sap/opu/odata/SALM/MC_SRV/DocTypeSet('${typeId}')/DocTypeDefects` +
    `?$filter=${encodeURIComponent(`Id eq '${trimmedDefectId}'`)}&$expand=DefectStatuses`;

  const defectLookupResponse = await executeHttpRequest(
    { destinationName: SOLMAN_DESTINATION_NAME },
    {
      method: 'get',
      url: defectLookupUrl,
      headers: {
        Accept: 'application/json',
      },
    }
  );

  const defectEntries = extractODataResults(defectLookupResponse?.data);
  const defectEntry = defectEntries[0];

  return defectEntry ?? null;
}

async function fetchSolmanNotesByGuid(guid, processType = 'S1DM') {
  const normalizedGuid = normalizeGuidLiteral(guid);

  if (!normalizedGuid) {
    return [];
  }

  const notesUrl =
    `/sap/opu/odata/SALM/CRM_GENERIC_SRV/WORKSPACESET(` +
    `Guid=guid'${normalizedGuid}',ProcessType='${processType}')/BTTEXTSet` +
    `?sap-language=EN&$filter=${encodeURIComponent('ConfigId eq 5')}`;

  const notesResponse = await executeHttpRequest(
    { destinationName: SOLMAN_DESTINATION_NAME },
    {
      method: 'get',
      url: notesUrl,
      headers: {
        Accept: 'application/json',
      },
    }
  );

  return extractODataResults(notesResponse?.data);
}

async function fetchSolmanDefectAttachments(guid) {
  const crmId = compactSolmanGuid(guid);
  if (!crmId) {
    return [];
  }

  const attachmentsListUrl =
    `/sap/opu/odata/SALM/DROP_DOC_SRV/CharmWP_WI_BRSet(` +
    `CrmId=${toODataStringKey(crmId)},BranchId='0')/attachedDeltaDocuments`;

  const attachmentsListResponse = await executeHttpRequest(
    { destinationName: SOLMAN_DESTINATION_NAME },
    {
      method: 'get',
      url: attachmentsListUrl,
      headers: {
        Accept: 'application/json',
      },
    }
  );

  const attachmentEntries = extractODataResults(attachmentsListResponse?.data);
  const downloadedAttachments = [];

  for (const entry of attachmentEntries) {
    const filename = String(entry?.Filename || entry?.FileName || 'attachment').trim() || 'attachment';
    const entryCrmId = String(entry?.CrmId || crmId).trim();
    const docId = String(entry?.DocId || '').trim();
    const branchId = String(entry?.BranchId || '').trim();
    const structureId = String(entry?.StructureId || '').trim();

    if (!entryCrmId || !docId) {
      LOG.warn('Skipping SolMan attachment due to missing document key fields', { crmId });
      continue;
    }

    const sapClient = String(process.env.SOLMAN_SAP_CLIENT || '001').trim();
    const sapLanguage = String(process.env.SOLMAN_SAP_LANGUAGE || 'EN').trim();
    const downloadUrl =
      `/sap/opu/odata/SALM/DROP_DOC_SRV/DocumentSet(` +
      `BranchId=${toODataStringKey(branchId)},` +
      `CrmId=${toODataStringKey(entryCrmId)},` +
      `DocId=${toODataStringKey(docId)},` +
      `StructureId=${toODataStringKey(structureId)})/documentContent/$value` +
      `?sap-client=${encodeURIComponent(sapClient)}&sap-language=${encodeURIComponent(sapLanguage)}`;

    const downloadResponse = await executeHttpRequest(
      { destinationName: SOLMAN_DESTINATION_NAME },
      {
        method: 'get',
        url: downloadUrl,
        headers: {
          Accept: '*/*',
        },
        responseType: 'arraybuffer',
      }
    );

    const content = toBuffer(downloadResponse?.data);
    const contentType = String(downloadResponse?.headers?.['content-type'] || 'application/octet-stream');
    const textPreview = await extractSolmanAttachmentText({
      filename,
      contentType,
      content,
    });

    downloadedAttachments.push({
      filename,
      contentType,
      size: content.length,
      textPreview,
    });
  }

  return downloadedAttachments;
}

async function runDefectPromptWithLlm({ defect, notes, attachments, client = orchestrationClient }) {
  if (!client) {
    LOG.warn('Skipping LLM call because orchestration client is not configured');
    return '';
  }

  const promptTemplate = await getParseDefectPromptTemplate();
  const placeholderValues = {
    DEFECT_HEADER_INFO: formatDefectHeaderInfo(defect),
    DEFECT_TEXT_INFO: formatDefectTextInfo(notes),
    DEFECT_ATTACHMENTS: formatDefectAttachments(attachments),
  };

  const renderedPrompt = renderPromptTemplate(promptTemplate, placeholderValues);

  LOG.info('Rendered defect prompt for LLM', {
    defectId: defect?.Id,
    guid: defect?.Guid,
    prompt: renderedPrompt,
  });

  const orchestrationResponse = await client.chatCompletion({
    messages: [
      {
        role: 'user',
        content: renderedPrompt,
      },
    ],
  });

  const llmResponse = orchestrationResponse.getContent() || '';
  LOG.info('Startup defect LLM response', {
    defectId: defect?.Id,
    guid: defect?.Guid,
    response: llmResponse,
    tokenUsage: orchestrationResponse.getTokenUsage(),
    requestId: orchestrationResponse.getRequestId(),
  });

  return llmResponse;
}

async function runDefectResolutionWithLlm({ defect, notes, attachments, sources, tcodePrograms, client = orchestrationClient }) {
  if (!client) {
    throw new Error('Orchestration client is not configured for defect analysis.');
  }

  const promptTemplate = await getDefectResolutionPromptTemplate();
  const renderedPrompt = renderPromptTemplate(promptTemplate, {
    DEFECT_HEADER_INFO: formatDefectHeaderInfo(defect),
    DEFECT_TEXT_INFO: formatDefectTextInfo(notes),
    DEFECT_ATTACHMENTS: formatDefectAttachments(attachments),
    ABAP_SOURCE_CODE: formatAbapSources(sources),
    TCODE_PROGRAM_MAPPING: JSON.stringify(tcodePrograms || [], null, 2),
  });
  const response = await client.chatCompletion({
    messages: [{ role: 'user', content: renderedPrompt }],
  });
  const findings = response.getContent() || '';
  if (!findings.trim()) {
    throw new Error('Defect analysis returned no findings.');
  }

  LOG.info('Defect resolution LLM findings', {
    defectId: defect?.Id,
    guid: defect?.Guid,
    response: findings,
    tokenUsage: response.getTokenUsage(),
    requestId: response.getRequestId(),
  });
  return findings;
}

function renderPromptTemplate(template, placeholderValues) {
  return String(template || '').replace(/\{\{(\w+)\}\}/g, (token, key) =>
    Object.hasOwn(placeholderValues || {}, key) ? String(placeholderValues[key] ?? '') : token
  );
}

async function processDefectForOrchestration(defectId, processType = 'S1DM', mode = 'Startup', config = {}) {
  const normalizedDefectId = String(defectId || '').trim();
  const result = {
    defectId: normalizedDefectId,
    guid: '',
    typeId: processType,
    status: 'FAILED',
    notesCount: 0,
    attachmentCount: 0,
    llmResponse: '',
    analysisResponse: '',
    error: '',
  };

  if (!normalizedDefectId) {
    result.error = 'Defect ID is empty.';
    return result;
  }

  try {
    const defect = await fetchSolmanDefectDetails(normalizedDefectId, processType);

    if (!defect) {
      result.status = 'NOT_FOUND';
      result.error = 'No defect row returned.';
      LOG.warn(`${mode} defect fetch returned no rows`, { defectId: normalizedDefectId });
      return result;
    }

    result.guid = String(defect.Guid || '').trim();
    result.typeId = String(defect.TypeId || processType).trim();

    LOG.info(`${mode} defect fetch succeeded`, {
      guid: defect.Guid,
      id: defect.Id,
      typeId: defect.TypeId ?? processType,
      status: defect.Status,
      reporter: defect.Reporter,
    });

    let notes = [];
    let attachments = [];
    let hadPartialFailure = false;

    try {
      notes = await fetchSolmanNotesByGuid(defect.Guid, defect.TypeId ?? processType);
      result.notesCount = notes.length;
      LOG.info(`${mode} defect notes fetch succeeded`, {
        guid: defect.Guid,
        defectId: defect.Id,
        notesCount: notes.length,
      });
    } catch (error) {
      hadPartialFailure = true;
      appendResultError(result, `Notes fetch failed: ${error?.message ?? String(error)}`);
      LOG.error(`${mode} defect notes fetch failed`, {
        guid: defect.Guid,
        defectId: defect.Id,
        ...extractHttpErrorDetails(error),
      });
    }

    try {
      attachments = await fetchSolmanDefectAttachments(defect.Guid);
      result.attachmentCount = attachments.length;
      LOG.info(`${mode} defect attachments fetch succeeded`, {
        guid: defect.Guid,
        defectId: defect.Id,
        attachmentCount: attachments.length,
      });
    } catch (error) {
      hadPartialFailure = true;
      appendResultError(result, `Attachments fetch failed: ${error?.message ?? String(error)}`);
      LOG.error(`${mode} defect attachments fetch failed`, {
        guid: defect.Guid,
        defectId: defect.Id,
        ...extractHttpErrorDetails(error),
      });
    }

    try {
      result.llmResponse = await runDefectPromptWithLlm({ defect, notes, attachments, client: config.client });
      result.llmResponse = await enrichLlmResponseWithTcodePrograms(result.llmResponse);
      result.llmResponse = await enrichLlmResponseWithAbapSources(result.llmResponse);
    } catch (error) {
      hadPartialFailure = true;
      appendResultError(result, `LLM call failed: ${error?.message ?? String(error)}`);
      LOG.error(`${mode} defect LLM call failed`, {
        guid: defect.Guid,
        defectId: defect.Id,
        ...extractHttpErrorDetails(error),
      });
    }

    if (result.llmResponse) {
      try {
        const payload = parseLlmResponseJson(result.llmResponse);
        if (!payload) {
          throw new Error('Cannot analyze defect because extraction did not return valid JSON.');
        }
        result.analysisResponse = await runDefectResolutionWithLlm({
          defect,
          notes,
          attachments,
          sources: payload.abap_sources,
          tcodePrograms: payload.tcode_programs,
          client: config.client,
        });
      } catch (error) {
        hadPartialFailure = true;
        appendResultError(result, `Defect analysis failed: ${error?.message ?? String(error)}`);
        LOG.error(`${mode} defect analysis failed`, {
          defectId: defect.Id,
          ...extractHttpErrorDetails(error),
        });
      }
    }

    if (result.analysisResponse) {
      const deliveryErrors = await deliverDefectFindings(normalizedDefectId, result.analysisResponse, config.recipients);
      if (deliveryErrors.length) {
        hadPartialFailure = true;
        for (const message of deliveryErrors) {
          appendResultError(result, message);
        }
      }
    }

    result.status = hadPartialFailure ? 'PARTIAL' : 'SUCCESS';
    return result;
  } catch (error) {
    result.status = 'FAILED';
    appendResultError(result, error?.message ?? String(error));
    LOG.error(`${mode} defect fetch failed`, {
      defectId: normalizedDefectId,
      ...extractHttpErrorDetails(error),
    });
    return result;
  }
}

async function deliverDefectFindings(defectId, findings, recipients) {
  const safeDefectId = defectId.replace(/[^A-Za-z0-9_-]/g, '_');
  const filename = `defect-${safeDefectId}-findings-${randomUUID()}.md`;
  const content = Buffer.from(findings, 'utf8');
  const contentType = 'text/markdown; charset=utf-8';
  const prefix = (process.env.OBJECTSTORE_PREFIX || 'defect-findings').replace(/\/+$/, '');
  const errors = [];

  try {
    const stored = await uploadBufferToObjectStore(content, {
      objectKey: `${prefix}/${filename}`,
      contentType,
    });
    LOG.info('Saved defect findings to object store', { defectId, key: stored.key });
  } catch (error) {
    errors.push(`Findings upload failed: ${error?.message ?? String(error)}`);
    LOG.error('Failed to save defect findings to object store', { defectId, ...extractHttpErrorDetails(error) });
  }

  try {
    await emailDocxAttachmentsViaDestination([{ filename, content, contentType }], {
      overrideRecipients: recipients,
      subject: process.env.EMAIL_SUBJECT || `SAP defect ${defectId} - LLM findings`,
      body: process.env.EMAIL_BODY || `Please find the LLM analysis findings for SAP defect ${defectId} attached.`,
    });
    LOG.info('Emailed defect findings', { defectId, filename });
  } catch (error) {
    errors.push(`Findings email failed: ${error?.message ?? String(error)}`);
    LOG.error('Failed to email defect findings', { defectId, ...extractHttpErrorDetails(error) });
  }

  return errors;
}

async function enrichLlmResponseWithTcodePrograms(llmResponse) {
  const payload = parseLlmResponseJson(llmResponse);
  if (!payload) {
    return llmResponse;
  }

  const tcodes = Array.isArray(payload.tcodes)
    ? payload.tcodes.map((item) => String(item || '').trim().toUpperCase()).filter(Boolean)
    : [];

  const abapPrograms = Array.isArray(payload.abap_programs)
    ? payload.abap_programs.map((item) => String(item || '').trim().toUpperCase()).filter(Boolean)
    : [];

  const zTcodes = [...new Set(tcodes.filter((tcode) => tcode.startsWith('Z')))];
  const tcodePrograms = [];
  for (const tcode of zTcodes) {
    try {
      const program = await fetchProgramForTcode(tcode);
      if (program) {
        tcodePrograms.push({ tcode, program });
        if (!abapPrograms.includes(program)) {
          abapPrograms.push(program);
        }
        LOG.info('Resolved tcode to program from ZGW_AI_SRV', { tcode, program });
      } else {
        LOG.warn('No program mapping returned for tcode from ZGW_AI_SRV', { tcode });
      }
    } catch (error) {
      LOG.warn('Failed to resolve program for tcode from ZGW_AI_SRV', {
        tcode,
        ...extractHttpErrorDetails(error),
      });
    }
  }

  payload.tcodes = tcodes;
  payload.abap_programs = abapPrograms;
  payload.tcode_programs = tcodePrograms;
  return JSON.stringify(payload);
}

async function enrichLlmResponseWithAbapSources(llmResponse) {
  const payload = parseLlmResponseJson(llmResponse);
  if (!payload) {
    return llmResponse;
  }

  const programs = Array.isArray(payload.abap_programs)
    ? payload.abap_programs.map((item) => String(item || '').trim().toUpperCase())
    : [];
  const additionalPrograms = [...new Set(String(process.env.ADDITIONAL_ABAP_PROGRAMS || '')
    .split(',')
    .map((program) => program.trim().toUpperCase())
    .filter(Boolean))];
  const sourcePrograms = [...new Set([
    ...programs.filter((program) => program.startsWith('Z')),
    ...additionalPrograms,
  ])];
  const sources = [];

  for (const program of sourcePrograms) {
    try {
      const response = await fetchZgwAiEntity('SourceSet', { program });
      const code = response?.code ?? response?.d?.code;
      if (typeof code !== 'string' || !code.trim()) {
        throw new Error('No source code returned for program.');
      }

      sources.push({ program, code });
      LOG.info('Fetched ABAP source code from ZGW_AI_SRV', { program, sourceLength: code.length });
    } catch (error) {
      sources.push({ program, code: '', error: error?.message ?? String(error) });
      LOG.warn('Failed to fetch ABAP source code from ZGW_AI_SRV', {
        program,
        ...extractHttpErrorDetails(error),
      });
    }
  }

  payload.abap_programs = [...new Set([...programs.filter(Boolean), ...additionalPrograms])];
  payload.additional_abap_programs = additionalPrograms;
  payload.abap_sources = sources;
  return JSON.stringify(payload);
}

function parseLlmResponseJson(llmResponse) {
  const text = String(llmResponse || '').trim();
  if (!text) {
    return null;
  }

  try {
    return JSON.parse(text);
  } catch {
    const fenced = text.match(/```(?:json)?\s*([\s\S]*?)\s*```/i);
    if (!fenced) {
      LOG.warn('LLM response is not valid JSON; skipping tcode program enrichment');
      return null;
    }

    try {
      return JSON.parse(fenced[1]);
    } catch {
      LOG.warn('LLM fenced response is not valid JSON; skipping tcode program enrichment');
      return null;
    }
  }
}

async function fetchProgramForTcode(tcode) {
  const response = await fetchZgwAiEntity('TcodeProgramSet', { tcode });
  return extractProgramFromTcodeResponse(response);
}

async function fetchZgwAiEntity(entityName, key) {
  const service = await cds.connect.to('ZGW_AI_SRV', {
    credentials: {
      ...cds.env.requires.ZGW_AI_SRV.credentials,
      destination: S4_DESTINATION_NAME,
      path: normalizeServiceRootPath(ZGW_AI_SRV_PATH),
    },
  });
  const query = cds.ql.SELECT.one.from(service.entities[entityName], key);
  const { method, path: entityPath } = cds.odata.urlify(query, service);
  return service.send({
    method,
    path: `${entityPath}?$format=json`,
    headers: { Accept: 'application/json' },
  });
}

function normalizeServiceRootPath(pathValue) {
  const raw = String(pathValue || '').trim();
  if (!raw) {
    return '/sap/opu/odata/sap/ZGW_AI_SRV';
  }

  const withLeadingSlash = raw.startsWith('/') ? raw : `/${raw}`;
  return withLeadingSlash.replace(/\/+$/, '');
}

function extractProgramFromTcodeResponse(data) {
  const direct =
    data?.d?.program ??
    data?.d?.Program ??
    data?.program ??
    data?.Program;

  if (direct) {
    return String(direct).trim().toUpperCase();
  }

  const fromResults = data?.d?.results?.[0] ?? data?.results?.[0] ?? data?.value?.[0];
  const resultProgram = fromResults?.program ?? fromResults?.Program;
  if (resultProgram) {
    return String(resultProgram).trim().toUpperCase();
  }

  return '';
}

function parseReviewConfig(data = {}) {
  const llmModel = String(data.llmModel ?? LLM_MODEL_NAME).trim();
  const maxTokens = data.maxTokens ?? MAX_TOKENS;
  if (!llmModel || llmModel.length > 128) {
    throw cds.error('Provide a valid LLM model name.', { code: 400 });
  }
  if (!Number.isInteger(maxTokens) || maxTokens <= 0 || maxTokens > 2147483647) {
    throw cds.error('Max Tokens must be a positive integer.', { code: 400 });
  }

  let recipients;
  if (data.emailTo !== undefined && data.emailTo !== null) {
    const addresses = String(data.emailTo).split(',').map((address) => address.trim());
    if (!addresses.length || addresses.some((address) => !/^[^\s@,;<>]+@[^\s@,;<>]+\.[^\s@,;<>]+$/.test(address))) {
      throw cds.error('Provide valid comma-separated email recipients.', { code: 400 });
    }
    recipients = [...new Set(addresses)];
  }

  return { llmModel, maxTokens, recipients };
}

function createOrchestrationClient({ llmModel = LLM_MODEL_NAME, maxTokens: configuredMaxTokens = MAX_TOKENS } = {}) {
  if (!process.env.LLM_MODEL_NAME || !process.env.RESOURCE_GROUP) {
    LOG.warn('Orchestration env vars are missing; using defaults', {
      modelName: LLM_MODEL_NAME,
      resourceGroup: RESOURCE_GROUP,
    });
  }

  const maxTokens = Number.isFinite(configuredMaxTokens) && configuredMaxTokens > 0 ? configuredMaxTokens : 100000;

  return new OrchestrationClient(
    {
      promptTemplating: {
        model: {
          name: llmModel,
          params: {
            max_tokens: maxTokens,
          },
        },
      },
    },
    {
      resourceGroup: RESOURCE_GROUP,
    }
  );
}

async function getParseDefectPromptTemplate() {
  return parseDefectPromptTemplate ||= await loadPromptTemplate('parse_defect_prompt.md');
}

async function getDefectResolutionPromptTemplate() {
  return defectResolutionPromptTemplate ||= await loadPromptTemplate('defect_resolution_prompt.md');
}

async function loadPromptTemplate(filename) {
  const candidatePaths = [
    new URL(`./prompts/${filename}`, import.meta.url),
    path.resolve(process.cwd(), 'srv', 'prompts', filename),
  ];

  for (const candidatePath of candidatePaths) {
    try {
      return await readFile(candidatePath, 'utf8');
    } catch {
      // Try next path candidate.
    }
  }

  throw new Error(`Unable to load ${filename} from known locations`);
}

function formatAbapSources(sources) {
  if (!Array.isArray(sources) || sources.length === 0) {
    return 'No ABAP source code available.';
  }

  return sources.map((source) => {
    const program = String(source?.program || 'Unknown');
    const code = typeof source?.code === 'string' ? source.code : '';
    return `ABAP Object: ${program}\n${code || `Source unavailable: ${source?.error || 'No source code returned.'}`}`;
  }).join('\n\n');
}

function formatDefectHeaderInfo(defect) {
  return JSON.stringify(defect || {}, null, 2);
}

function formatDefectTextInfo(notes) {
  if (!Array.isArray(notes) || notes.length === 0) {
    return 'No defect text entries found.';
  }

  return notes
    .map((note, index) => {
      const sender = String(note?.TextSender || '').trim() || 'Unknown';
      const date = String(note?.TextDate || '').trim() || 'Unknown';
      const type = String(note?.TextType || '').trim() || 'Unknown';
      const value = String(note?.TextValue || '').trim();
      return `#${index + 1} [${type}] ${sender} @ ${date}\n${value}`;
    })
    .join('\n\n');
}

function formatDefectAttachments(attachments) {
  if (!Array.isArray(attachments) || attachments.length === 0) {
    return 'No Solution Manager defect attachments returned.';
  }

  return attachments
    .map((attachment, index) => {
      const filename = String(attachment?.filename || 'attachment').trim();
      const contentType = String(attachment?.contentType || 'application/octet-stream').trim();
      const size = Number(attachment?.size || 0);
      const textPreview = String(attachment?.textPreview || '').trim();
      return `#${index + 1} ${filename} (${contentType}, ${size} bytes)\n${textPreview}`;
    })
    .join('\n\n');
}

function extractODataResults(payload) {
  if (!payload) {
    return [];
  }

  const results = payload?.d?.results ?? payload?.value ?? payload?.results ?? [];
  return Array.isArray(results) ? results : [results];
}

function extractFilterValue(req, propertyName) {
  const filter = req.query?.$filter ?? req._queryOptions?.filter ?? '';
  if (!filter) {
    return undefined;
  }

  const match = new RegExp(`${propertyName}\\s+eq\\s+['\"]?([^'\")]+)['\"]?`, 'i').exec(
    String(filter)
  );

  return match ? match[1] : undefined;
}

function parseStartupDefectIds(rawValue) {
  return String(rawValue || '')
    .split(',')
    .map((value) => value.trim())
    .filter(Boolean);
}

function appendResultError(result, message) {
  const text = String(message || '').trim();
  if (!text) {
    return;
  }

  result.error = result.error ? `${result.error}; ${text}` : text;
}

function compactSolmanGuid(value) {
  const canonical = normalizeGuidLiteral(value);
  return canonical ? canonical.replace(/-/g, '') : '';
}

function toODataStringKey(value) {
  const escaped = String(value ?? '').replace(/'/g, "''");
  return `'${escaped}'`;
}

function toBuffer(data) {
  if (Buffer.isBuffer(data)) {
    return data;
  }

  if (data instanceof ArrayBuffer) {
    return Buffer.from(data);
  }

  if (ArrayBuffer.isView(data)) {
    return Buffer.from(data.buffer, data.byteOffset, data.byteLength);
  }

  if (typeof data === 'string') {
    return Buffer.from(data, 'utf8');
  }

  if (data == null) {
    return Buffer.alloc(0);
  }

  return Buffer.from(String(data), 'utf8');
}

function extractAttachmentPreview(content, contentType) {
  const previewLimit = 400;
  const text = decodeText(content);
  return text ? text.slice(0, previewLimit) : `binary attachment (${content.length} bytes)`;
}

async function extractSolmanAttachmentText({ filename, contentType, content }) {
  const normalizedType = String(contentType || '').toLowerCase();
  const extension = path.extname(String(filename || '')).toLowerCase();

  if (isPlainTextContent(normalizedType, extension)) {
    return truncateText(decodeText(content) || 'No text could be decoded from plain-text attachment.');
  }

  if (normalizedType.includes('pdf') || extension === '.pdf') {
    try {
      const pdfParseModule = await import('pdf-parse');
      const extracted = await extractPdfTextFromModule(pdfParseModule, content);
      return truncateText(extracted || 'No extractable text found in PDF.');
    } catch (error) {
      return `PDF text extraction failed: ${error?.message ?? String(error)}`;
    }
  }

  if (
    normalizedType.includes('wordprocessingml') ||
    extension === '.docx' ||
    extension === '.docm'
  ) {
    try {
      const mammothModule = await import('mammoth');
      const mammoth = mammothModule.default || mammothModule;
      const result = await mammoth.extractRawText({ buffer: content });
      return truncateText((result?.value || '').trim() || 'No extractable text found in DOCX document.');
    } catch (error) {
      return `DOCX text extraction failed: ${error?.message ?? String(error)}`;
    }
  }

  if (
    normalizedType.includes('spreadsheetml') ||
    normalizedType.includes('excel') ||
    extension === '.xlsx' ||
    extension === '.xls' ||
    extension === '.csv'
  ) {
    try {
      const xlsxModule = await import('xlsx');
      const xlsx = xlsxModule.default || xlsxModule;
      const workbook = xlsx.read(content, { type: 'buffer' });
      const sheetsText = workbook.SheetNames.map((sheetName) => {
        const sheet = workbook.Sheets[sheetName];
        const csv = xlsx.utils.sheet_to_csv(sheet);
        return `Sheet: ${sheetName}\n${csv}`.trim();
      }).join('\n\n');
      return truncateText(sheetsText || 'No extractable text found in spreadsheet.');
    } catch (error) {
      return `Spreadsheet text extraction failed: ${error?.message ?? String(error)}`;
    }
  }

  return `Text extraction not supported for attachment type '${contentType || extension || 'unknown'}'.`;
}

function isPlainTextContent(contentType, extension) {
  return (
    String(contentType || '').includes('text') ||
    String(contentType || '').includes('json') ||
    String(contentType || '').includes('xml') ||
    ['.txt', '.log', '.json', '.xml', '.csv', '.md'].includes(String(extension || ''))
  );
}

function decodeText(content) {
  try {
    return Buffer.from(content).toString('utf8').replace(/\u0000/g, '').trim();
  } catch {
    return '';
  }
}

function truncateText(text) {
  const normalized = String(text || '').trim();
  const max = Number.isFinite(MAX_ATTACHMENT_TEXT_CHARS) && MAX_ATTACHMENT_TEXT_CHARS > 0
    ? MAX_ATTACHMENT_TEXT_CHARS
    : 4000;
  return normalized.length > max ? `${normalized.slice(0, max)}\n\n[Truncated ${normalized.length - max} chars]` : normalized;
}

async function extractPdfTextFromModule(pdfParseModule, content) {
  const PDFParseClass = pdfParseModule?.PDFParse;
  if (typeof PDFParseClass === 'function') {
    const parser = new PDFParseClass({ data: content });
    try {
      const textResult = await parser.getText();
      return String(textResult?.text || '').trim();
    } finally {
      await parser.destroy();
    }
  }

  const defaultExport = pdfParseModule?.default;
  if (typeof defaultExport === 'function') {
    const parsed = await defaultExport(content);
    return String(parsed?.text || '').trim();
  }

  if (typeof pdfParseModule === 'function') {
    const parsed = await pdfParseModule(content);
    return String(parsed?.text || '').trim();
  }

  const exportKeys = Object.keys(pdfParseModule || {});
  throw new Error(`Unsupported pdf-parse module shape. Available exports: ${exportKeys.join(', ')}`);
}

function normalizeGuidLiteral(value) {
  const trimmed = String(value || '').trim();
  if (!trimmed) {
    return '';
  }

  const unwrapped = trimmed.replace(/^guid'/i, '').replace(/'$/, '');
  const hexOnly = unwrapped.replace(/-/g, '');

  if (/^[0-9a-fA-F]{32}$/.test(hexOnly)) {
    const canonical =
      `${hexOnly.slice(0, 8)}-${hexOnly.slice(8, 12)}-${hexOnly.slice(12, 16)}-` +
      `${hexOnly.slice(16, 20)}-${hexOnly.slice(20)}`;
    return canonical.toUpperCase();
  }

  return unwrapped;
}

function extractHttpErrorDetails(error) {
  const response =
    error?.response ??
    error?.cause?.response ??
    error?.originalError?.response ??
    error?.rootCause?.response;

  const status = response?.status;
  const statusText = response?.statusText;
  const responseHeaders = response?.headers;
  const responseData =
    response?.data ??
    response?.body ??
    error?.data ??
    error?.body;
  const code = error?.code ?? error?.cause?.code;
  const message = error?.message ?? error?.cause?.message ?? String(error);

  return {
    status,
    statusText,
    code,
    error: message,
    responseHeaders,
    responseData,
  };
}
