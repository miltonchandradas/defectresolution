import cds from '@sap/cds';
import { executeHttpRequest } from '@sap-cloud-sdk/http-client';

const LOG = cds.log('defectresolution');
const SOLMAN_DESTINATION_NAME = 'Solman_Prod';
const STARTUP_DEFECT_IDS = parseStartupDefectIds(
  process.env.STARTUP_DEFECT_IDS ?? '8000197596'
);

export default cds.service.impl(async function () {
  const { DefectHeader, DefectNotes } = this.entities;

  cds.spawn({ after: 30000 }, async () => {
    if (!STARTUP_DEFECT_IDS.length) {
      LOG.warn('Startup defect fetch skipped because no defect IDs are configured');
      return;
    }

    for (const startupDefectId of STARTUP_DEFECT_IDS) {
      try {
        const defect = await fetchSolmanDefectDetails(startupDefectId);

        if (defect) {
          LOG.info('Startup defect fetch succeeded', {
            guid: defect.Guid,
            id: defect.Id,
            typeId: defect.TypeId ?? 'S1DM',
            status: defect.Status,
            reporter: defect.Reporter,
          });

          try {
            const notes = await fetchSolmanNotesByGuid(defect.Guid, defect.TypeId ?? 'S1DM');
            LOG.info('Startup defect notes fetch succeeded', {
              guid: defect.Guid,
              defectId: defect.Id,
              notesCount: notes.length,
              notes,
            });
          } catch (error) {
            LOG.error('Startup defect notes fetch failed', {
              guid: defect.Guid,
              defectId: defect.Id,
              ...extractHttpErrorDetails(error),
            });
          }
        } else {
          LOG.warn('Startup defect fetch returned no rows', { defectId: startupDefectId });
        }
      } catch (error) {
        LOG.error('Startup defect fetch failed', {
          defectId: startupDefectId,
          ...extractHttpErrorDetails(error),
        });
      }
    }
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
  const status = error?.response?.status;
  const responseData = error?.response?.data;
  const message = error?.message ?? String(error);

  return {
    status,
    error: message,
    responseData,
  };
}
