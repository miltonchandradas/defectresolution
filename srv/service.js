import cds from '@sap/cds';

const { SELECT } = cds.ql;

export default cds.service.impl(async function () {
  const { DefectHeader } = this.entities;
  const MC_Service = await cds.connect.to('MC_SRV');

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
  const result = await MC_Service.run(
    SELECT.from('MC_SRV.DocTypeSet', (dt) => {
      dt.where({ Id: typeId });
      dt.expand('DocTypeDefects', (defects) => {
        defects.filter({ Id: defectId });
        defects.expand('DefectStatuses');
      });
    })
  );

  const docType = Array.isArray(result) ? result[0] : result;
  const defects = docType?.DocTypeDefects ?? [];

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
