import cds from '@sap/cds';
import { executeHttpRequest } from '@sap-cloud-sdk/http-client';

const LOG = cds.log('defectresolution');
const SOLMAN_DESTINATION_NAME = 'Solman_Prod';

export default cds.service.impl(async function () {
  const { DefectHeader } = this.entities;

  cds.spawn({ after: 30000 }, async () => {
    try {
      const defect = await fetchSolmanDefectDetails('8000197596');

      if (defect) {
        LOG.info('Startup defect fetch succeeded', {
          id: defect.Id,
          typeId: defect.TypeId ?? 'S1DM',
          status: defect.Status,
          reporter: defect.Reporter,
        });
      } else {
        LOG.warn('Startup defect fetch returned no rows', { defectId: '8000197596' });
      }
    } catch (error) {
      LOG.error('Startup defect fetch failed', error);
    }
  });

  this.on('READ', DefectHeader, async (req) => {
    const params = Array.isArray(req.params) ? req.params[0] : req.params ?? {};
    const defectId =
      params?.id ??
      params?.Id ??
      req.data?.id ??
      req.data?.Id ??
      extractFilterValue(req, 'Id');

    const typeId =
      params?.typeId ??
      params?.TypeId ??
      req.data?.typeId ??
      req.data?.TypeId ??
      'S1DM';

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
