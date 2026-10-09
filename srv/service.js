import cds from '@sap/cds';

export default cds.service.impl(async function () {
  const { DefectHeader } = this.entities;
  const MC_Service = await cds.connect.to('MC_SRV');

  cds.spawn({ after: 30000 }, async () => {
    try {
      const defects = await getDefectsForType(MC_Service, 'S1DM', '8000197596');
      const defect = defects[0];

      if (defect) {
        cds.log.info('Startup defect fetch succeeded', {
          id: defect.Id,
          typeId: defect.TypeId ?? 'S1DM',
          status: defect.Status,
          reporter: defect.Reporter,
        });
      } else {
        cds.log.warn('Startup defect fetch returned no rows', { defectId: '8000197596' });
      }
    } catch (error) {
      console.error('Startup defect fetch failed', error);
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

    const defects = await getDefectsForType(MC_Service, typeId, defectId);

    return defects.map((item) => ({
      guid: item.Guid,
      id: item.Id,
      typeId: item.TypeId ?? typeId,
      reporter: item.Reporter,
      status: item.Status,
      createdAt: item.CreatedAt,
      changedAt: item.ChangedAt,
    }));
  });
});

async function getDefectsForType(MC_Service, typeId, defectId) {
  const path = `/DocTypeSet('${typeId}')/DocTypeDefects?$filter=${encodeURIComponent(`Id eq '${defectId}'`)}&$expand=DefectStatuses&$format=json`;

  const response = await MC_Service.send({
    method: 'GET',
    path,
    headers: { Accept: 'application/json' }
  });

  const defects = response?.d?.results ?? response?.value ?? [];
  return Array.isArray(defects) ? defects : [defects];
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
