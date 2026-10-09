using {defectresolution as my} from '../db/schema.cds';

@path: '/service/defects'

service DefectService {
    entity DefectHeader as projection on my.DefectHeader;
}