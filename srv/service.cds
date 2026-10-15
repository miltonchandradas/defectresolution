using {defectresolution as my} from '../db/schema.cds';

@path: '/service/defects'

service DefectService {
    entity DefectHeader as projection on my.DefectHeader;
    entity DefectNotes as projection on my.DefectNotes;
    entity TcodePrograms as projection on my.TcodePrograms;

    type DefectOrchestrationResult {
        defectId        : String(40);
        guid            : String(40);
        typeId          : String(10);
        status          : String(20);
        notesCount      : Integer;
        attachmentCount : Integer;
        llmResponse     : LargeString;
        analysisResponse : LargeString;
        error           : LargeString;
    }

    action triggerDefectOrchestration(
        defectIds   : String,
        processType : String,
        llmModel    : String(128),
        maxTokens   : Integer,
        emailTo     : String
    ) returns many DefectOrchestrationResult;
}