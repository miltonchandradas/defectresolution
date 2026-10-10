import cds from '@sap/cds';
import { executeHttpRequest } from '@sap-cloud-sdk/http-client';
import { OrchestrationClient } from '@sap-ai-sdk/orchestration';
import { readFile } from 'node:fs/promises';
import path from 'node:path';

const LOG = cds.log('defectresolution');
const SOLMAN_DESTINATION_NAME = 'Solman_Prod';
const LLM_MODEL_NAME = String(process.env.LLM_MODEL_NAME || 'gpt-5.5').trim();
const RESOURCE_GROUP = String(process.env.RESOURCE_GROUP || 'default').trim();
const MAX_TOKENS = Number.parseInt(String(process.env.MAX_TOKENS || '100000'), 10);
const MAX_ATTACHMENT_TEXT_CHARS = Number.parseInt(String(process.env.MAX_ATTACHMENT_TEXT_CHARS || '4000'), 10);
const STARTUP_DEFECT_IDS = parseStartupDefectIds(
  process.env.STARTUP_DEFECT_IDS ?? '8000197596'
);

const orchestrationClient = createOrchestrationClient();
let parseDefectPromptTemplate;

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

    const results = [];
    for (const defectId of defectIds) {
      const result = await processDefectForOrchestration(defectId, processType, 'On-demand');
      results.push(result);
    }

    return results;
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

async function runDefectPromptWithLlm({ defect, notes, attachments }) {
  if (!orchestrationClient) {
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

  const orchestrationResponse = await orchestrationClient.chatCompletion({
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

function renderPromptTemplate(template, placeholderValues) {
  let rendered = String(template || '');

  for (const [key, value] of Object.entries(placeholderValues || {})) {
    const token = `{{${key}}}`;
    rendered = rendered.replaceAll(token, String(value ?? ''));
  }

  return rendered;
}

async function processDefectForOrchestration(defectId, processType = 'S1DM', mode = 'Startup') {
  const normalizedDefectId = String(defectId || '').trim();
  const result = {
    defectId: normalizedDefectId,
    guid: '',
    typeId: processType,
    status: 'FAILED',
    notesCount: 0,
    attachmentCount: 0,
    llmResponse: '',
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
      result.llmResponse = await runDefectPromptWithLlm({ defect, notes, attachments });
    } catch (error) {
      hadPartialFailure = true;
      appendResultError(result, `LLM call failed: ${error?.message ?? String(error)}`);
      LOG.error(`${mode} defect LLM call failed`, {
        guid: defect.Guid,
        defectId: defect.Id,
        ...extractHttpErrorDetails(error),
      });
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

function createOrchestrationClient() {
  if (!process.env.LLM_MODEL_NAME || !process.env.RESOURCE_GROUP) {
    LOG.warn('Orchestration env vars are missing; using defaults', {
      modelName: LLM_MODEL_NAME,
      resourceGroup: RESOURCE_GROUP,
    });
  }

  const maxTokens = Number.isFinite(MAX_TOKENS) && MAX_TOKENS > 0 ? MAX_TOKENS : 100000;

  return new OrchestrationClient(
    {
      promptTemplating: {
        model: {
          name: LLM_MODEL_NAME,
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
  if (parseDefectPromptTemplate) {
    return parseDefectPromptTemplate;
  }

  const candidatePaths = [
    new URL('./prompts/parse_defect_prompt.md', import.meta.url),
    path.resolve(process.cwd(), 'srv', 'prompts', 'parse_defect_prompt.md'),
  ];

  for (const candidatePath of candidatePaths) {
    try {
      parseDefectPromptTemplate = await readFile(candidatePath, 'utf8');
      return parseDefectPromptTemplate;
    } catch {
      // Try next path candidate.
    }
  }

  throw new Error('Unable to load parse_defect_prompt.md from known locations');
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
