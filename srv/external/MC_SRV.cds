/* checksum : e6f2e34e732a07f691a1a04cc980ec98 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service MC_SRV {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ProbabilitySet {
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    key Severity : Integer not null;
    @sap.unicode : 'false'
    Description : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ImpactSet {
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    key ImpactId : Integer not null;
    @sap.unicode : 'false'
    ImpactDescription : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity StrategySet {
    @sap.unicode : 'false'
    key RiskStrategy : String(3) not null;
    @sap.unicode : 'false'
    Description : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RiskSet {
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    key riskId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(4) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    riskTitle : String(40);
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    projectGuid : String(32);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    projectType : String(20);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    projectname : String(80);
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    owner : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ownerId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    processor : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    processorId : String(10) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    reportedBy : String(80);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    reportedById : String(10);
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    @sap.filterable : 'false'
    Priority : Integer not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Probability : String(2);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Probability_text : String(40);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    SaveStatus : String;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Impact : String(2);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Impact_text : String(40);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    riskLevel : String(40);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    riskLevelNo : String(1);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Status : String;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusText : String(30) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    riskStrategy : String(3);
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    riskStrategy_text : String(40);
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryText : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ProjectPhase : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectPhaseText : String(80) not null;
    @sap.unicode : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_project : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_owner : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_processor : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_category : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_status : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_priority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_title : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_projectPhase : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_impact : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_probability : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_strategy : Boolean not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    RiskStatuses : Association to many StatusSet {  };
    RiskPriorities : Association to many PrioritySet {  };
    RiskProbabilities : Association to many ProbabilitySet {  };
    RiskImpacts : Association to many ImpactSet {  };
    RiskStrategies : Association to many StrategySet {  };
    RiskLevels : Association to many RISKLEVELSet {  };
    ProjectPhaseSet : Association to many ProjectPhaseSet {  };
    RiskProjectPhases : Association to many ProjectPhaseSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RISKLEVELSet {
    @sap.unicode : 'false'
    key Risk_level : String(1) not null;
    @sap.unicode : 'false'
    Description : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WorkPackageSet {
    @sap.unicode : 'false'
    @sap.label : 'id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(4) not null;
    ClassifAttributes : ClassifAttributes not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseComponent : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Actual Release'
    @sap.sortable : 'false'
    ActualRelease : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch ID'
    @sap.filterable : 'false'
    Branch_id : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch Name'
    @sap.filterable : 'false'
    BranchName : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Build Finish'
    @sap.filterable : 'false'
    BuildFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Business Process Expert'
    BusinessProcessExpert : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Business Process Expert ID'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessProcessExpert_id : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category'
    Category : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category Level'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Advisory Board'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeAdvisoryBoard : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Transaction Last Changed Time'
    ChangedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed By'
    ChangedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Manager'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Classification Key'
    @sap.filterable : 'false'
    classificationkey : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Completion'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Completion : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'Conversion'
    @sap.filterable : 'false'
    conversion : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Time of transaction creation'
    CreatedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Created By'
    CreatedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Current Processor'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CurrentProcessor : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateTypeId : String(20) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateValue : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'Developer'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Developer : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Dev Team'
    DevTeam : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DevTeam_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Bpexpert : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Category : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Completion : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Dev_Team : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Discription : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_finish_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Owner : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Priority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Project_Manager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_ProjectPhase : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Requested_Release : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_start_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Title : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStatus : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Effort Point'
    @sap.filterable : 'false'
    Effort : Integer not null;
    @sap.unicode : 'false'
    EFFORTPOINTF : String(12);
    @sap.unicode : 'false'
    @sap.label : 'Element'
    Element : String(22);
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementName : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'Enhancement'
    @sap.filterable : 'false'
    enh : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Finish'
    @sap.filterable : 'false'
    FinishDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Interface'
    @sap.filterable : 'false'
    interface : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'IT Operator'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ITOperator : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Language'
    Language : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Local Requirement'
    Local : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.filterable : 'false'
    LocalB : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Max Lines'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Owner'
    Owner : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Owner ID'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Owner_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Function'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunction : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunctionId : String(22) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNameId : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'PPM Resource'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PPMResource : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    Priority : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.label : 'Test Completed'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PrMnd : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Production Manager'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProductionManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Name'
    Project : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectEditable : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Manager'
    ProjectManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectManager_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectMandatory : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase Guid'
    ProjectPhase : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectPhaseText : String(40) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ReleaseComponent : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Remarks'
    @sap.sortable : 'false'
    Remarks : String(255);
    @sap.unicode : 'false'
    @sap.label : 'Report'
    @sap.filterable : 'false'
    report : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Requested Release'
    @sap.sortable : 'false'
    RequestedRelease : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Save Status'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SaveStatus : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'SFT Finished'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SFTFinished : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Solution ID'
    Solution_id : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'SOLUTION DESCRIPTION (from texts)'
    SolutionDescription : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Solution Name'
    @sap.filterable : 'false'
    SolutionName : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'SPEC Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SpecFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Start'
    @sap.filterable : 'false'
    StartDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status'
    Status : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Scope : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusText : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Tester'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Tester : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Title'
    Title : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'URL to CRM UI'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Value Point'
    @sap.filterable : 'false'
    Value_Point : Integer not null;
    @sap.unicode : 'false'
    VALUEPOINTF : String(12);
    @sap.unicode : 'false'
    @sap.label : 'Workflow'
    @sap.filterable : 'false'
    workflow : Boolean not null;
    @sap.unicode : 'false'
    WricefString : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Work package ID'
    WpId : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Work Package Assignment'
    wpassignment : String not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    wpurl : String not null;
    WorkPackagePriorities : Association to many PrioritySet {  };
    WorkPackageStatuses : Association to many StatusSet {  };
    WorkPackageCategories : Association to many CategorySet {  };
    ProjectPhaseSet : Association to many ProjectPhaseSet {  };
    WorkPackageProjectPhases : Association to many ProjectPhaseSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PrioritySet {
    @sap.unicode : 'false'
    @sap.label : 'Priority Guid'
    key Id : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority Description'
    Description : String(60) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity StatusSet {
    @sap.unicode : 'false'
    @sap.label : 'Status'
    key Id : String(5) not null;
    @sap.unicode : 'false'
    @sap.label : 'Process Type'
    key ProcessType : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Description'
    Description : String(30) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity DocTypeSet {
    @sap.unicode : 'false'
    @sap.label : 'Type Id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'ReadAuth'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    read_auth : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'WriteAuth'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    write_auth : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Type'
    Name : String(40) not null;
    DocTypeRisks : Association to many RiskSet {  };
    DocWorkPackages : Association to many WorkPackageSet {  };
    DocTypeProjects : Association to many ProjectSet {  };
    DocTypeStatuses : Association to many StatusSet {  };
    DocWorkItems : Association to many WorkItemSet {  };
    DocTypePriorities : Association to many PrioritySet {  };
    DocTypeCategories : Association to many CategorySet {  };
    DocTypePartnerFunctions : Association to many PartnerFunctionSet {  };
    DocTypeSolutions : Association to many SOLUTIONSet {  };
    RequestForChangeSet : Association to many RequestForChangeSet {  };
    DocTypeCategoryDefects : Association to many CategoryDefectSet {  };
    DocTypeDefects : Association to many DefectSet {  };
    RequirementSet : Association to many RequirementSet {  };
    ChangeDocumentSet : Association to many ChangeDocumentSet {  };
    ApprovalProcedureSet : Association to many ApprovalProcedureSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ProjectSet {
    @sap.unicode : 'false'
    @sap.label : 'PPM Project GUID'
    key ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'PPM Project ID'
    key ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.label : 'PPM Project Name'
    Description : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM GUID for Workpackage or workspace'
    WsGuid : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    AllProj : Boolean;
    ProjectProjectPhases : Association to many ProjectPhaseSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ProjectPhaseSet {
    @sap.unicode : 'false'
    @sap.label : 'Wave GUID'
    key WaveGuid : String(32) not null;
    @sap.unicode : 'false'
    key ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Wave Display name'
    WaveDescription : String(132) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM GUID for workpackage or workitem'
    WsGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM type (WP or WI)'
    WsType : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    WaveDisabled : Boolean not null;
    Wave_Sprints : Association to many SPRINTSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SPRINTSet {
    @sap.unicode : 'false'
    @sap.label : 'Wave Display name'
    key WaveDescription : String(60) not null;
    @sap.unicode : 'false'
    @sap.label : 'Wave GUID'
    key SprintGuid : String(32) not null;
    @sap.unicode : 'false'
    key ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM GUID for workpackage or workitem'
    WsGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM type (WP or WI)'
    WsType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity Types_WorkitemSet {
    @sap.unicode : 'false'
    @sap.label : 'Type Id'
    key Id : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Type'
    Name : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity InfoSet {
    @sap.unicode : 'false'
    @sap.label : 'Info Name'
    key Name : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Info Value'
    Value : String(80) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WorkItemSet {
    @sap.unicode : 'false'
    @sap.label : 'Id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseComponent : String(50) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ActReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Actual Release'
    @sap.sortable : 'false'
    ActualRelease : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Architect'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Architect : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Architect edit'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Architect_edit : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Architect id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Architect_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Build Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BuildFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category'
    Category : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category Level'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Transaction Last Changed Time'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed By'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangedBy : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Manager'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager_edit : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Manager id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Classification Key'
    @sap.filterable : 'false'
    classificationkey : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Completion'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Completion : String(5) not null;
    @sap.unicode : 'false'
    @sap.label : 'Time of transaction creation'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CreatedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Created By'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CreatedBy : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Current Processor'
    @sap.sortable : 'false'
    CurrentProcessor : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateTypeId : String(20);
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateValue : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'Design Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DesignFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Developer'
    Developer : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Developer_edit : Boolean not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Developer_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Dev Team'
    DevTeam : String(80) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    DevTeam_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_category : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_completion : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_developer : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_finish_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_it_operator : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_priority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_project_manager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_projectPhase : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_requested_release : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_start_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_status : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_tester : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_title : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FinishDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'IT Operator'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ITOperator : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ITOperator_id : String(10) not null;
    @sap.unicode : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunctionId : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNameId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNumber : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    Priority : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Name'
    Project : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectEditable : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase Guid'
    ProjectPhase : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase'
    @sap.filterable : 'false'
    ProjectPhaseText : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Referring Work Packages'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    RefWP : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Referring WP URL'
    @sap.filterable : 'false'
    RefWPUrl : String not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ReleaseComponent : String(80) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Save Status'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SaveStatus : String not null;
    @sap.unicode : 'false'
    Sprint : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SprintCompleted : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Start'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StartDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status'
    Status : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusText : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Story Point'
    @sap.filterable : 'false'
    storyPoint : Integer not null;
    @sap.unicode : 'false'
    STORYPOINTF : String(20);
    @sap.unicode : 'false'
    @sap.label : 'Tester'
    Tester : String(80) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Tester_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Test Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Title'
    Title : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Work item GC or NC'
    @sap.sortable : 'false'
    Type : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'URL to CRM UI'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Value Point'
    @sap.filterable : 'false'
    Value_Point : Integer not null;
    @sap.unicode : 'false'
    VALUEPOINTF : String(20);
    @sap.unicode : 'false'
    @sap.label : 'Work Package Assignment'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    wpassignment : String not null;
    @sap.unicode : 'false'
    WricefString : String(50) not null;
    WorkItemCategories : Association to many CategorySet {  };
    WorkItemSprints : Association to many SPRINTSet {  };
    ProjectPhaseSet : Association to many ProjectPhaseSet {  };
    WorkItemProjectPhases : Association to many ProjectPhaseSet {  };
    WorkItemStatuses : Association to many StatusSet {  };
    WorkItemPriorities : Association to many PrioritySet {  };
    WorkItemWricef : Association to many WRICEFSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CategorySet {
    @sap.unicode : 'false'
    @sap.label : 'Id'
    key Id : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Level'
    CatLevel : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Name'
    Name : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Guid'
    Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Parent Guid'
    ParentGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Aspect Id'
    AspId : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Aspect Guid'
    AspGuid : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PartnerFunctionSet {
    @sap.unicode : 'false'
    @sap.label : 'ID'
    key PartnerFunctionId : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Process Type'
    ProcessType : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String(30) not null;
    PartnerFunctionBusinessPartners : Association to many BusinessPartnerSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BusinessPartnerSet {
    @sap.unicode : 'false'
    @sap.label : 'Partner GUID'
    key PartnerGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Person or organization'
    PartnerType : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'First Name'
    FirstName : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Last Name'
    LastName : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Function'
    Role : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'CRM GUID'
    WsGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Name'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FullName : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Number'
    RefPartner : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Function'
    RefPartnerFct : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Number'
    Partner : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Function'
    PartnerFct : String(8) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity MC_DateSet {
    @sap.unicode : 'false'
    key DateType : String(40) not null;
    @sap.unicode : 'false'
    WsGuid : String(32) not null;
    @sap.unicode : 'false'
    Date : String(10) not null;
    @sap.unicode : 'false'
    Time : String(8) not null;
    @sap.unicode : 'false'
    WsApptType : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    Editable : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RequestedReleaseSet {
    @sap.unicode : 'false'
    @sap.label : 'Sublandscape ID'
    key ReleaseComponent : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'Release Number'
    key ReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Tooltip for cycle description'
    CycleDescription : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'id'
    Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Client'
    Client : String(3) not null;
    @sap.unicode : 'false'
    @sap.label : 'Cycle Type'
    ReleaseType : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change'
    GolivePostponed : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Cycle'
    SmiProject : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Object GUID'
    ReleaseCrmGuid : UUID not null;
    @sap.unicode : 'false'
    @sap.label : 'Transaction No.'
    ReleaseCrmId : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Task List ID'
    TasklistId : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch ID'
    BranchId : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'Release Status'
    ReleaseStatus : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'Release Number'
    MajorPredRel : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Release Number'
    MinorPredRel : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Release Number'
    CustomerRelease : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'User name'
    CreatedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'User name'
    ChangedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Delete'
    DeleteFlag : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    ReleaseCycleDescription : String not null;
    @sap.unicode : 'false'
    WS_GUID : String(32);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BRANCHSet {
    @sap.unicode : 'false'
    key BranchId : String(44) not null;
    @sap.unicode : 'false'
    key SolutionId : String(44) not null;
    @sap.unicode : 'false'
    BranchName : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch Type'
    BranchType : String(10);
    @sap.unicode : 'false'
    @sap.label : 'Transaction Type'
    ProcessType : String(4);
    Elements : Association to many ELEMENTSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLUTIONSet {
    @sap.unicode : 'false'
    @sap.label : 'Solution ID'
    key SolutionId : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'Solution Name'
    SolutionName : String(30) not null;
    Branches : Association to many BRANCHSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ELEMENTSet {
    @sap.unicode : 'false'
    key BranchId : String(44) not null;
    @sap.unicode : 'false'
    @sap.label : 'ID'
    key ElementId : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'Max Lines'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Selectable : String(1) not null;
    @sap.unicode : 'false'
    ElementTypeId : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'Parent ID'
    ParentId : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    ElementTypeDescr : String(120) not null;
    @odata.Type : 'Edm.Byte'
    @sap.unicode : 'false'
    @sap.label : 'Int.'
    Level : Integer not null;
    @sap.unicode : 'false'
    Path : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Name'
    ElementName : String(255) not null;
  } actions {
    function Get_Sub_Elements(
      @odata.Type : 'Edm.Byte'
      ParentLevel : Integer,
      ParentId : String(44)
    ) returns many ELEMENTSet;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ELEMENTTYPESet {
    @sap.unicode : 'false'
    @sap.label : 'Element Type ID'
    key ElementTypeId : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'Element Type Description'
    ElementTypeDescr : String(120) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity LANGUAGESet {
    @sap.unicode : 'false'
    @sap.label : 'ISO LANGUAGE'
    key IsoLanguage : String(2) not null;
    @sap.unicode : 'false'
    @sap.label : 'language text'
    key LanguageText : String(16) not null;
    @sap.unicode : 'false'
    @sap.label : 'SYSTEME LANGUAGE'
    SystLanguage : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WRICEFSet {
    @sap.unicode : 'false'
    key ![KEY] : String(8) not null;
    @sap.unicode : 'false'
    VALUE : String(30) not null;
    @sap.unicode : 'false'
    DOCTYPE : String(10);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WPASSIGNMENTSet {
    @sap.unicode : 'false'
    @sap.label : 'Code'
    key Code : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ValuePointSet {
    @sap.unicode : 'false'
    key High : String(5) not null;
    @sap.unicode : 'false'
    key Low : String(5) not null;
    @sap.unicode : 'false'
    key Options : String(4) not null;
    @sap.unicode : 'false'
    key Sign : String(1) not null;
    @sap.unicode : 'false'
    key transactionType : String(8) not null;
    @sap.unicode : 'false'
    text : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity EffortPointSet {
    @sap.unicode : 'false'
    key High : String(5) not null;
    @sap.unicode : 'false'
    key Low : String(5) not null;
    @sap.unicode : 'false'
    key Options : String(4) not null;
    @sap.unicode : 'false'
    key Sign : String(1) not null;
    @sap.unicode : 'false'
    key transactionType : String(8) not null;
    @sap.unicode : 'false'
    text : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity storyPointSet {
    @sap.unicode : 'false'
    key High : String(5) not null;
    @sap.unicode : 'false'
    key Low : String(5) not null;
    @sap.unicode : 'false'
    key Options : String(4) not null;
    @sap.unicode : 'false'
    key Sign : String(1) not null;
    @sap.unicode : 'false'
    key transactionType : String(8) not null;
    @sap.unicode : 'false'
    text : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity RequestForChangeSet {
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    @sap.sortable : 'false'
    PriorityId : Integer not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Title : String(40) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    StatusId : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SatusText : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    CategoryText : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    ChangeCycleGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeCycleNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeCycleDescription : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    RequesterId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    RequesterText : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    ChangeManagerId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManagerText : String(80) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    ApprProcId : String(8) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ApprProcText : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Standard Change'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    StandardChange : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Solution : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    saveStatus : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditRequester : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditChgManager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStatus : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditCategory : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditPriority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTitle : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditChangeCycle : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStandardChange : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditApprProc : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    StatusSet : Association to many StatusSet {  };
    PrioritySet : Association to many PrioritySet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity ChangeCycleSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Description : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity CategoryDefectSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Id : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Description : String(50) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity WorkpackageF4Set {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ID : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Title : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity ChangeDocumentSet {
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Guid : String(32) not null;
    @sap.unicode : 'false'
    key TypeId : String(8) not null;
    @sap.unicode : 'false'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    PriorityId : Integer not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Title : String(40) not null;
    @sap.unicode : 'false'
    StatusId : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SatusText : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    CategoryText : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeCycleGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeCycleDescription : String(40) not null;
    @sap.unicode : 'false'
    Developer_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Developer : String(80) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Tester_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Tester : String(80) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    ReleaseManager_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ReleaseManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManagerId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManagerText : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Actual Release'
    ActualRelease : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseComponent : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    saveStatus : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditDeveloper : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditChgManager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStatus : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditCategory : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditPriority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTitle : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditChangeCycle : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditActualRelease : Boolean not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    DevTeam_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DevTeam : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditDevTeam : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTester : Boolean not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    TypeText : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditReleaseManager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    PrioritySet : Association to many PrioritySet {  };
    StatusSet : Association to many StatusSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity TypesChgDocSet {
    @sap.unicode : 'false'
    @sap.label : 'Type Id'
    key Id : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Type'
    Name : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity DefectSet {
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Guid : String(32) not null;
    @sap.unicode : 'false'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Category'
    @sap.sortable : 'false'
    Category : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    ChangedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    ChangedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    CreatedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    CreatedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    DCorrection : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DCorrectionUrl : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    DCorrectionId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DefectCategory : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    DefectCategoryId : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditDCorrection : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditDCategory : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditCategory : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditPriority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditProject : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStatus : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTitle : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTeam : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditReporter : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditProcessor : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditTpln : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Effort : Integer not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EffortPointF : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    MsgProcessor : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MsgProcessorId : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    @sap.sortable : 'false'
    PriorityId : Integer not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Project : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    ProjectPhase : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase Guid'
    @sap.filterable : 'false'
    ProjectPhaseGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Reporter : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ReporterId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SaveStatus : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Scope : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ScopeId : String(24) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Status : String(30) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusId : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Support Team'
    SupportTeam : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SupportTeamId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestCase : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestCaseId : String(24) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    Title : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Test Plan'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TplnGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Test Plan ID'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TplnId : String(24) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TplnText : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    DefectProjectPhases : Association to many ProjectPhaseSet {  };
    DefectStatuses : Association to many StatusSet {  };
    DefectPriorities : Association to many PrioritySet {  };
    DefectCategoriesDefect : Association to many CategoryDefectSet {  };
    DefectCategories : Association to many CategorySet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity ApprovalProcedureSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ![Key] : String(8) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Value : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProcessType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity DefectCorrSet {
    @sap.unicode : 'false'
    @sap.label : 'Id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'URL to CRM UI'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunctionId : String(80) not null;
    @sap.unicode : 'false'
    WricefString : String(10) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    VALUEPOINTF : String;
    @sap.unicode : 'false'
    @sap.label : 'Value'
    @sap.filterable : 'false'
    Value_Point : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Signed INT2 / int16'
    @sap.filterable : 'false'
    storyPoint : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category Level'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateTypeId : String(20);
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNameId : String(10) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNumber : String(24) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectEditable : String(1) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    STORYPOINTF : String;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DateValue : String(10) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ReleaseComponent : String(50) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    ActReleaseNumber : String(12) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ActReleaseComponent : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Guid'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProjectId : String(24) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase'
    @sap.filterable : 'false'
    ProjectPhaseText : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Save Status'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SaveStatus : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Name'
    Project : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Work item GC or NC'
    @sap.sortable : 'false'
    Type : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Title'
    Title : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    Description : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    Priority : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status'
    Status : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusText : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category'
    Category : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Start'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StartDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FinishDate : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Completion'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Completion : String(5) not null;
    @sap.unicode : 'false'
    @sap.label : 'Project Phase Guid'
    ProjectPhase : String(32) not null;
    @sap.unicode : 'false'
    Sprint : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Actual Release'
    @sap.sortable : 'false'
    ActualRelease : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Dev Team'
    DevTeam : String(80) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    DevTeam_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Developer'
    Developer : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Developer_edit : Boolean not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Developer_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Tester'
    Tester : String(80) not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    Tester_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'IT Operator'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ITOperator : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_it_operator : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_tester : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_category : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_status : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_priority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_title : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_start_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_requested_release : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_project_manager : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_finish_date : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_developer : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_completion : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    edit_projectPhase : Boolean not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ITOperator_id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Build Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BuildFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Design Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DesignFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Test Finish'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestFinish : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Manager'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Manager id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager_id : String(10) not null;
    @sap.unicode : 'false'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    owner : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ownerId : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Current Processor'
    @sap.sortable : 'false'
    CurrentProcessor : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeManager_edit : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SprintCompleted : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Time of transaction creation'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CreatedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Created By'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CreatedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed By'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Transaction Last Changed Time'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Referring Work Package'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    RefWP : String(20) not null;
    @sap.unicode : 'false'
    @sap.label : 'Classification Key'
    @sap.filterable : 'false'
    classificationkey : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Work Package Assignment'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    wpassignment : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Referring Work Package URL'
    @sap.filterable : 'false'
    RefWPUrl : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Architect'
    @sap.sortable : 'false'
    Architect : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Architect id'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Architect_id : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity ScopeSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ScopeId : String(22) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ScopeText : String(120) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SolutionId : String(44) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity RequirementSet {
    @sap.unicode : 'false'
    @sap.label : 'id'
    key Id : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TypeId : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch ID'
    Branch_id : String(44) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch Name'
    @sap.filterable : 'false'
    BranchName : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Business Process Expert'
    BusinessProcessExpert : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Business Process Expert ID'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessProcessExpert_id : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category'
    Category : String(50) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryGuid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Category Level'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CategoryLevel : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'Transaction Last Changed Time'
    ChangedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed By'
    ChangedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Classification Key'
    @sap.filterable : 'false'
    classificationkey : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Conversion'
    @sap.filterable : 'false'
    conversion : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Time of transaction creation'
    CreatedAt : String(30) not null;
    @sap.unicode : 'false'
    @sap.label : 'Created By'
    CreatedBy : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    @sap.filterable : 'false'
    Description : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Category : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Discription : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Bpexpert : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Owner : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Priority : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    EditStatus : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Edit_Title : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Effort Point'
    @sap.filterable : 'false'
    Effort : Integer not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    EFFORTPOINTF : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Element'
    Element : String;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementName : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'Enhancement'
    @sap.filterable : 'false'
    enh : Boolean not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Guid : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Interface'
    @sap.filterable : 'false'
    interface : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsFinal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Language'
    Language : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Local Requirement'
    @sap.sortable : 'false'
    Local : String(1) not null;
    @sap.unicode : 'false'
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LocalB : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Max Lines'
    MaxLines : String not null;
    @sap.unicode : 'false'
    @sap.filterable : 'false'
    PARA_CACHE_ID : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Partner Function'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunction : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerFunctionId : String(80) not null;
    @sap.unicode : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PartnerNameId : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    Priority : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    PriorityText : String(60) not null;
    @sap.unicode : 'false'
    @sap.label : 'Remarks'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Remarks : String(255);
    @sap.unicode : 'false'
    @sap.label : 'Report'
    @sap.filterable : 'false'
    report : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Save Status'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SaveStatus : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Solution ID'
    Solution_id : String(22) not null;
    @sap.unicode : 'false'
    @sap.label : 'SOLUTION DESCRIPTION (from texts)'
    @sap.filterable : 'false'
    SolutionDescription : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'Solution Name'
    @sap.filterable : 'false'
    SolutionName : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status'
    Status : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Text'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusText : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Title'
    Title : String(255) not null;
    @sap.unicode : 'false'
    @sap.label : 'URL to CRM UI'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Url : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Value Point'
    @sap.filterable : 'false'
    Value_Point : Integer not null;
    @sap.unicode : 'false'
    VALUEPOINTF : String;
    @sap.unicode : 'false'
    @sap.label : 'Workflow'
    @sap.filterable : 'false'
    workflow : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Owner'
    Owner : String(80) not null;
    @sap.unicode : 'false'
    @sap.label : 'Owner ID'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Owner_id : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'WPASSIGNMENT'
    wpassignment : String(4) not null;
    @sap.unicode : 'false'
    @sap.label : 'Work Package ID'
    @sap.filterable : 'false'
    WpId : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Work package URL'
    @sap.filterable : 'false'
    wpurl : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Scope'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    Scope : String(80) not null;
    @sap.unicode : 'false'
    WricefString : String(20) not null;
    RequirementPriorities : Association to many PrioritySet {  };
    RequirementStatuses : Association to many StatusSet {  };
    REQElements : Association to many ELEMENTSet {  };
  } actions {
    function UNASSIGN_BR_FROM_ELEMENT(
      BranchId : String,
      elementId : String,
      RequirementGuid : String(32)
    ) returns many RequirementSet;
  };

  @cds.external : true
  type ClassifAttributes {
    @sap.label : 'Component name'
    AttrName : String(30);
    @sap.label : 'Classification'
    ![Key] : String(8);
    @sap.label : 'Text'
    Value : String(80);
  };
};

