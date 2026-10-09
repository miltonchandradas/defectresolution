namespace defectresolution;

using {ZGW_AI_SRV} from '../srv/external/ZGW_AI_SRV';

entity Sources           as
    projection on ZGW_AI_SRV.SourceSet {
        key program,
            code
    }

entity Programs          as
    projection on ZGW_AI_SRV.ProgramSet {
        key package,
            programs
    }

entity TransportPrograms as
    projection on ZGW_AI_SRV.TransportProgramSet {
        key transport,
            programs
    }

entity DefectTransports  as
    projection on ZGW_AI_SRV.DefectTransportSet {
        key defect,
            latestTransport,
            programs,
            latestVersions,
            previousVersions,
            latestSources,
            previousSources
    }

using {MC_SRV} from '../srv/external/MC_SRV';

entity DefectHeader      as
    projection on MC_SRV.DefectSet {
        key Guid      as guid,
            Id        as id,
            TypeId    as typeId,
            Reporter  as reporter,
            Status    as status,
            CreatedAt as createdAt,
            ChangedAt as changedAt
    }

using {CRM_GENERIC_SRV} from '../srv/external/CRM_GENERIC_SRV';

entity DefectNotes       as
    projection on CRM_GENERIC_SRV.BTTEXTSET {
        key WsGuid     as guid,
        key TextType   as textType,
        key TextTypeId as textTypeId,
        key TextDate   as textDate,
            TextSender as textSender,
            TextValue  as textValue
    }
