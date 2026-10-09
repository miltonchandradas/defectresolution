/* checksum : 2f2fdb4e4278cf0a6ecf42fc7e76b87b */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service CRM_GENERIC_SRV {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_ITPPM_F4SET {
    @sap.label : 'Appl. GUID'
    key ProjectGuid : UUID not null;
    @sap.label : 'Number'
    key ProjectId : String(24) not null;
    @sap.label : 'Object GUID'
    RefGuid : UUID not null;
    @sap.label : 'Appl. GUID'
    RequestedPhase : UUID not null;
    @sap.label : 'Text'
    ProjectName : String(80) not null;
    PPMPROJECT_WAVEF4 : Association to many WAVEF4SET {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PRIOF4SET {
    key PrioKey : String(40) not null;
    PrioValue : String(132) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTCATEGORYf4SET {
    @sap.label : 'Guid'
    key Guid : String(32) not null;
    @sap.label : 'Aspect Guid'
    key AspGuid : String(32) not null;
    @sap.label : 'Level'
    CatLevel : String(10) not null;
    ProcType : String(1) not null;
    @sap.label : 'Name'
    Name : String(50) not null;
    @sap.label : 'Description'
    Description : String(50) not null;
    @sap.label : 'Parent Guid'
    ParentGuid : String(32) not null;
    @sap.label : 'Id'
    Id : String(40) not null;
    @sap.label : 'Aspect Id'
    AspId : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTTEXTSET {
    @sap.label : 'Work Package ID'
    key WsGuid : String(32) not null;
    @sap.label : 'Text Type (reply, memo, ...)'
    key TextType : String(30) not null;
    key TextTypeId : String(4) not null;
    @sap.label : 'Date'
    key TextDate : String(21) not null;
    @sap.label : 'Text ID'
    TextId : String(4) not null;
    @sap.label : 'Sender Name'
    TextSender : String(80) not null;
    @sap.label : 'String'
    TextValue : String not null;
    @sap.label : 'Language Text'
    TextLanguage : String(16) not null;
    ConfigId : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTTEXTDESCRIPTIONSET {
    @sap.label : 'Work Package ID'
    key WsGuid : String(32) not null;
    @sap.label : 'Text Type (reply, memo, ...)'
    key TextType : String(30) not null;
    key TextTypeId : String(4) not null;
    @sap.label : 'Date'
    key TextDate : String(21) not null;
    @sap.label : 'Text ID'
    TextId : String(4) not null;
    @sap.label : 'Sender Name'
    TextSender : String(80) not null;
    @sap.label : 'String'
    TextValue : String not null;
    @sap.label : 'Language Text'
    TextLanguage : String(16) not null;
    ConfigId : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity STATUSSET {
    @sap.label : 'Status ID'
    key StatusId : String(5) not null;
    @sap.label : 'Status Name'
    StatusName : String(30) not null;
    @sap.label : 'Workspace Type'
    WsType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity DETAILSET {
    @sap.label : 'Work Package ID'
    key WsId : String(32) not null;
    @sap.label : 'Work Package GUID'
    key WsGuid : String(32) not null;
    @sap.label : 'Work Package Details field'
    key WsField : String not null;
    @sap.label : 'Work Package Details Field TYpe (INPUT, LABEL, LINK, ...)'
    key WsType : String not null;
    @sap.label : 'Work Package Details object'
    WsObject : String not null;
    @sap.label : 'Work Package Details Text Value'
    WsText : String not null;
    @sap.label : 'Work Package Details URL'
    WsUrl : String not null;
    ReadOnly : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_PROCESSTYPESSet {
    key WpGuid : String(32) not null;
    key TypeId : String(40) not null;
    TypeName : String(132) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_WRICEFSet {
    key ![Key] : String(8) not null;
    key WpGuid : String(32) not null;
    Value : String(80) not null;
    WiGuid : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_DOCSet {
    key ItemGuid : String not null;
    key WpGuid : String(32) not null;
    Context : String not null;
    @sap.label : 'Object ID'
    Objid : String(32) not null;
    @sap.label : 'Description'
    Title : String(64) not null;
    @sap.label : 'Description'
    StatusText : String(64) not null;
    @sap.label : 'Name'
    DocuTypeText : String(40) not null;
    @sap.label : 'Complete name'
    AuthorFullname : String(80) not null;
    @sap.label : 'Indicator'
    Checked : Boolean not null;
    @sap.label : 'Indicator'
    Selectable : Boolean not null;
    @sap.label : 'Client'
    Client : String(3) not null;
    @sap.label : 'context info'
    ContextOcc : String(67) not null;
    @sap.label : 'Object GUID'
    RfcGuid : UUID not null;
    @sap.label : 'Branch Name'
    SbraTxt : String(50) not null;
    @sap.label : 'View Description'
    ViewTxt : String(50) not null;
    @sap.label : 'Description'
    OccTxt : String(255) not null;
    @sap.label : 'Path'
    Path : String not null;
    @sap.label : 'Element Type'
    ObjectDesc : String(120) not null;
    @sap.label : 'Solution Name'
    SlanDesc : String(50) not null;
    @sap.label : 'Element Type'
    ObjectType : String(26) not null;
    Guid : String(32) not null;
    Url : String not null;
    Parent : String not null;
    Leaf : String(67) not null;
    @sap.label : 'Indicator'
    Deleted : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_PARTNERSSet {
    key WpGuid : String(32) not null;
    key PartFuncId : String(40) not null;
    PartFuncName : String(132) not null;
    Prefilled : String(1) not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PartnerFCT_F4Set {
    @sap.label : 'Transaction Type'
    key ProcessType : String(4) not null;
    @sap.label : 'Partner Function'
    key PartnerFct : String(8) not null;
    @sap.label : 'Client'
    Mandt : String(3) not null;
    @sap.label : 'Text'
    PartnerFctDescription : String(30) not null;
    @sap.label : 'Character Field of Length 12'
    Bpartnertype : String(12) not null;
    @sap.label : 'PartnerDetProc'
    DetermProc : String(8) not null;
    @sap.label : 'Sequence'
    DisplayOrder : String(2) not null;
    @sap.label : 'Function Type'
    PartnerFctType : String(10) not null;
    @sap.label : 'Relation Name'
    PartnersetReltn : String(40) not null;
    @sap.label : 'F4 Help'
    PartnerF4Help : String(10) not null;
    @sap.label : 'Function category'
    PartnerPft : String(4) not null;
    @sap.label : 'Text'
    PartnerFctAbbr : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_ASSIGNSET {
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    @sap.label : 'ID'
    key BranchId : String(22) not null;
    @sap.label : 'ID'
    key ElementId : String(22) not null;
    @sap.label : 'ID'
    SolutionId : String(22) not null;
    @sap.label : 'Solution Name'
    SolutionName : String(50) not null;
    @sap.label : 'Branch Name'
    BranchName : String(50) not null;
    ElementName : String not null;
  } actions {
    function Assign_Requirement(
      RequirementId : UUID,
      elementId : String,
      ScopeId : String
    ) returns many SOLDOC_ASSIGNSET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_SOLUTIONF4SET {
    @sap.label : 'Solution ID'
    key SolutionId : String(22) not null;
    @sap.label : 'Solution Tech Name'
    SolutionName : String(50) not null;
    @sap.label : 'Solution Name'
    SolutionDescription : String(30) not null;
    SOLDOC_BRANCHF4Set : Association to many SOLDOC_BRANCHF4SET {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_BRANCHF4SET {
    @sap.label : 'Branch ID'
    key BranchId : String(22) not null;
    @sap.label : 'Solution ID'
    key SolutionId : String(22) not null;
    @sap.label : 'Branch Tech Name'
    BranchName : String(50) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Return_all_branches : Boolean not null;
    @sap.label : 'Branch Type'
    BranchType : String(10) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_ELEMENTF4SET {
    @sap.label : 'Element Type'
    key ElementTypeId : String(26) not null;
    @sap.label : 'ID'
    key ElementId : String(22) not null;
    @sap.label : 'Branch ID'
    key BranchId : String(22) not null;
    @sap.label : 'Description'
    ElementTypeDescr : String(120) not null;
    @sap.label : 'Attr. Value'
    ElementName : String(255) not null;
    Path : String not null;
    @sap.label : 'Max Lines'
    MaxLines : String not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Selectable : String(1) not null;
    @sap.label : 'ID'
    ParentId : String(22) not null;
    @odata.Type : 'Edm.Byte'
    Level : Integer not null;
  } actions {
    function getSoldocTree() returns many SOLDOC_ELEMENTF4SET;
    function Get_Sub_Elements(
      @odata.Type : 'Edm.Byte'
      ParentLevel : Integer,
      ParentId : String
    ) returns many SOLDOC_ELEMENTF4SET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_ELEMENTTYPEF4SET {
    @sap.label : 'Element Type'
    key ElementTypeId : String(26) not null;
    @sap.label : 'Description'
    ElementTypeDescr : String(120) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_TRANSPORTREQSET {
    @sap.label : 'Task List'
    key Tasklist : String(10) not null;
    @sap.label : 'Request/Task'
    key TrorderNumber : String(20) not null;
    @sap.label : 'Logical System'
    TrReqShortDescription : String(60) not null;
    @sap.label : 'Single-Character Flag'
    WbRequest : String(1) not null;
    @sap.label : 'Single-Character Flag'
    CustRequest : String(1) not null;
    @sap.label : 'Text'
    TrText : String(60) not null;
    @sap.label : 'CTS ID'
    CtsId : String(32) not null;
    @sap.label : 'Transport Track'
    TransportTrack : String(8) not null;
    @sap.label : 'Source System'
    TrorderSystem : String(10) not null;
    @sap.label : 'Source Client'
    TrorderClient : String(3) not null;
    @sap.label : 'User Name'
    RespUser : String(12) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Created On'
    CreatedDate : Timestamp;
    @sap.label : 'Creation Time'
    CreatedTime : Time not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Release Date'
    ReleasedDate : Timestamp;
    @sap.label : 'Release Time'
    ReleasedTime : Time not null;
    @sap.label : 'Export Status'
    Status : String(4) not null;
    @sap.label : 'Type'
    Trfunction : String(1) not null;
    @sap.label : 'Creator'
    Originator : String(1) not null;
    @sap.label : 'ID of Creator'
    OriginatorId : String(32) not null;
    @sap.label : 'Change Process'
    OriginatorKey : String(32) not null;
    @sap.label : 'Request/Task'
    TrorderCopy : String(20) not null;
    @sap.label : 'Project'
    ProjectName : String(32) not null;
    @sap.label : 'Transport Target'
    Target : String(10) not null;
    @sap.label : 'Ext. System ID'
    SysName : String(8) not null;
    @sap.label : 'TS Type'
    SysType : String(16) not null;
    @sap.label : 'Cycle'
    SmiProject : String(10) not null;
    @sap.label : 'Char'
    TransCopies : String(40) not null;
    @sap.label : 'Char'
    CriticalObj : String(40) not null;
    @sap.label : 'Char'
    Conflicts : String(40) not null;
    @sap.label : 'Char'
    Trvalue : String(40) not null;
    @sap.label : 'Not More Closely Defined Area, Possibly Used for Patchlevels'
    Notasks : String(4) not null;
    @sap.label : 'Indicator'
    OpenTask : Boolean not null;
    @sap.label : 'Char'
    StatusText : String(40) not null;
    @sap.label : 'Object GUID'
    WsGuid : UUID not null;
    @sap.label : 'TS Type'
    TrorderType : String(16) not null;
    TRREQ_TRTASKSet : Association to many BT_TRANSTASKSet {  };
  } actions {
    function TRREQ_SHORT_DESCRIPTION() returns BT_TRANSPORTREQSET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_TRANSTASKSet {
    key Tasklist : String(10) not null;
    key TrorderNumber : String(20) not null;
    key SystemId : String(8) not null;
    key SystemClient : String(3) not null;
    TaskNb : String(20) not null;
    TrtaskNumber : String(20) not null;
    RespUser : String(12) not null;
    ReleasedDate : String(8) not null;
    ReleasedTime : String(6) not null;
    Status : String(1) not null;
    Trfunction : String(1) not null;
    Tarsystem : String(10) not null;
    Korrdev : String(10) not null;
    WsGuid : String(32) not null;
    StatusText : String(60) not null;
    TrorderType : String(16) not null;
    Trvalue : String(60) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SoldocSet {
    @sap.label : 'Solution ID'
    key SolutionId : String(22) not null;
    @sap.label : 'Branch ID'
    key BranchId : String(22) not null;
    @sap.label : 'ID'
    key ElementId : String(22) not null;
    @sap.label : 'Element Type'
    key ElementTypeId : String(26) not null;
    @sap.label : 'WP Guid'
    key WpGuid : String(32) not null;
    @sap.label : 'Solution Tech Name'
    SolutionName : String(50) not null;
    @sap.label : 'Branch Tech Name'
    BranchName : String(50) not null;
    @sap.label : 'Attr. Value'
    ElementName : String not null;
    @sap.label : 'Description'
    ElementTypeName : String(120) not null;
    @sap.label : 'Guid'
    RequirementGuid : String(32) not null;
    @sap.label : 'SolDoc URL'
    SoldocUrl : String not null;
    @sap.label : 'Truncated path of the element'
    ElementTruncPath : String not null;
    @sap.label : 'Path of the element'
    ElementPath : String not null;
    @sap.label : 'Max Results'
    MaxLines : String not null;
    @sap.label : 'Scope ID'
    ScopeId : String(22) not null;
    @sap.label : 'Description'
    ScopeText : String(120) not null;
  } actions {
    function Unassign_Soldoc(
      RequirementGuid : UUID
    ) returns many WORKSPACESET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_FILTERSET {
    key FilterId : String not null;
    key FilterType : String(30) not null;
    FilterName : String not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Selected : Boolean not null;
    WsType : String(4) not null;
    config_id : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTSCOPE_PARTNERSSet {
    key Guid : String(32) not null;
    @sap.label : 'GUID 16'
    key ItemGuid : String(32) not null;
    key WsId : String(32) not null;
    @sap.label : 'Character Field of Length 12'
    Bpartnertype : String(12) not null;
    @sap.label : 'BusinessPartner'
    Partner : String(10) not null;
    @sap.label : 'Partner Function'
    PartnerFct : String(8) not null;
    @sap.label : 'Main Partner'
    Mainpartner : String(1) not null;
    @sap.label : 'Description'
    PartnerName : String(50) not null;
    @sap.label : 'Text'
    PartnerFctName : String(30) not null;
    @sap.label : 'Indicator'
    Exist : Boolean not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_PARTNER_FCTSet {
    key WpGuid : String(32) not null;
    key PartFuncId : String(40) not null;
    PartFuncName : String(132) not null;
    Prefilled : String(1) not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SPRINTF4Set {
    @sap.label : 'Object GUID'
    key SprintGuid : UUID not null;
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    SprintDescription : String(132) not null;
    ProjectGuid : String(32) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    isReleased : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PROCESS_TYPESet {
    @sap.label : 'Transaction Type'
    key ProcessType : String(4) not null;
    @sap.label : 'Short Description'
    Text : String(20) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity USER_TRANSPORTSet {
    key User : String(12) not null;
    SystemId : String(8) not null;
    SystemType : String not null;
    SystemClient : String(3) not null;
    FullName : String(80) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTTESTCASESet {
    @sap.label : 'Object GUID'
    key Guid : UUID not null;
    @sap.label : 'Test Plan ID'
    key TestPlanId : String(35) not null;
    @sap.label : 'Test Package ID'
    key TestPackageId : String(35) not null;
    @sap.label : 'Ref. Object'
    key TestCaseId : String(255) not null;
    @sap.label : 'Partner Number'
    key TesterId : String(20) not null;
    @sap.label : 'Structure ID'
    LineId : String(32) not null;
    @sap.label : 'Solution ID'
    SolutionId : String(30) not null;
    @sap.label : 'Solution Tech Name'
    SolutionName : String(30) not null;
    @sap.label : 'Solution Name'
    SolutionDesc : String(50) not null;
    @sap.label : 'Branch ID'
    BranchId : String(22) not null;
    @sap.label : 'Branch Tech Name'
    BranchName : String(30) not null;
    @sap.label : 'Branch Name'
    BranchDesc : String(50) not null;
    @sap.label : 'Type Text'
    TemplateTypeText : String(60) not null;
    @sap.label : 'Explanatory text'
    TemplateText : String(75) not null;
    @sap.label : 'Test Plan Description'
    TestPlanDscr : String(100) not null;
    @sap.label : 'Test Plan Description'
    TestPackageDscr : String(100) not null;
    @sap.label : 'Name'
    TestCaseTitle : String(70) not null;
    @sap.label : 'Variant'
    TestCaseVariant : String(30) not null;
    @sap.label : 'GUID'
    TestCaseKey : LargeBinary not null;
    @sap.label : 'Image'
    TestCaseType : String not null;
    TestCaseTypeText : String not null;
    @sap.label : 'Test Case Priority'
    TestCasePriority : String(10) not null;
    @sap.label : 'Test Case ID'
    TestObject : String(300) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    NoteAvailable : String(1) not null;
    @sap.label : 'Test Sequence'
    SequenceId : String(35) not null;
    @sap.label : 'short text'
    SequenceText : String(100) not null;
    @sap.label : 'GUID'
    StatusKey : LargeBinary not null;
    @sap.label : 'Image'
    StatusIcon : String not null;
    StatusTooltip : String not null;
    @sap.label : 'short text'
    StatusText : String(100) not null;
    @sap.label : 'Description'
    TesterName : String(80) not null;
    TestCasePriorityTxt : String not null;
    TcsePath : String not null;
    @sap.label : 'Single-Character Flag'
    TcseHasNote : String(1) not null;
    @sap.label : 'Logical System'
    TcseNoteIcon : String(60) not null;
    TcseStatusPath : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PROBLEM_CATEGORY_F4Set {
    @sap.label : '3-Byte field'
    key PbCatId : String(40) not null;
    PbCatDescription : String(132) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTSRVREQUESTHSet {
    key WsGuid : String(32) not null;
    ProblemCategoryDesc : String(132) not null;
    @sap.label : 'Problem Category'
    ProblemCategory : String(3) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTServiceLevelSet {
    key Guid : String(32) not null;
    ServProfileTxt : String not null;
    RespProfiileTxt : String not null;
    Contract : String not null;
    Warranty : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BUSINESS_USERSet {
    key User : String(50) not null;
    PartnerNo : String(10) not null;
    FullName : String(50) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PROJECT_PHASE_F4Set {
    @sap.label : 'Object GUID'
    key ProjectPhaseGuid : UUID not null;
    ProjectPhaseDescription : String(132) not null;
    ProjectGuid : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_REQUEST_CHANGESet {
    key TypeId : String(4) not null;
    key Guid : String(44) not null;
    Id : String(44) not null;
    Title : String(40) not null;
    Description : String not null;
    Requester : String(50) not null;
    Priority : String(132) not null;
    Category : String(50) not null;
    ChangManager : String(50) not null;
    ActualRelease : String(44) not null;
    SoldToParty : String(50) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ApprovalSet {
    @sap.label : 'UUID'
    key GUID : UUID not null;
    @sap.label : 'UUID'
    key PARENT_GUID : UUID not null;
    @sap.label : 'Signed INT2 / int16'
    key STEP_NO : Integer not null;
    APPROVAL_RESULT : String(5) not null;
    APPROVED_DATE : String(8) not null;
    APPROVED_TIME : String(6) not null;
    CHANGED_DATE : String(8) not null;
    CHANGED_TIME : String(6) not null;
    ENTERED_BY : String(20) not null;
    CREATED_BY : String(20) not null;
    CHANGED_BY : String(20) not null;
    @sap.label : 'Indicator'
    IS_EDITABLE : Boolean not null;
    STEP_ID : String(10) not null;
    STEP_DESCRIPTION : String(40) not null;
    @sap.label : 'Signed INT2 / int16'
    STEP_SEQUENCE : Integer not null;
    STEP_TYPE : String(1) not null;
    PARTNER_FCT : String(80) not null;
    PARTNER_FCT_DESC : String(40) not null;
    PARTNER_NO : String(20) not null;
    PROCESSED_BY : String(60) not null;
    @sap.label : 'Indicator'
    IS_RELEVANT : Boolean not null;
    @sap.label : 'Indicator'
    IS_LOCKED : Boolean not null;
    APRV_STATUS_PF : String(8) not null;
    APRV_ACT : String(5) not null;
    EXECUTION_STATUS : String(5) not null;
    MODE : String(1) not null;
    @sap.label : 'Indicator'
    NO_AUTHORIZATION : Boolean not null;
    PARTNER_NAME : String(50) not null;
    APRV_ACT_DESC : String(30) not null;
    APRV_PFCT_DESC : String(30) not null;
  } actions {
    function Approval_Action(
      wsGuid : String,
      Mode : String
    ) returns ApprovalSet;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SOLDOC_SCOPEF4Set {
    @sap.label : 'Scope ID'
    key ScopeId : String(22) not null;
    @sap.label : 'Description'
    ScopeText : String(120) not null;
    @sap.label : 'Scope ID'
    SolutionId : String(22) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity EffortPointSet {
    key High : String(5) not null;
    key transactionType : String(8) not null;
    text : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ValuePointSet {
    key High : String(5) not null;
    key transactionType : String(8) not null;
    text : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity StoryPointSet {
    key High : String(5) not null;
    key transactionType : String(8) not null;
    text : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RELATEDTRANSFieldsSet {
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    @sap.label : 'Object GUID'
    key RelatedTransGuid : UUID not null;
    @sap.label : 'Transaction Type'
    RelatedTranProcType : String(4) not null;
    @sap.label : 'Transaction Descript'
    RelatedTransProcDesc : String(30) not null;
    Type : String(10) not null;
    @sap.label : 'Object GUID'
    ProjectGuid : UUID not null;
    @sap.label : 'Number'
    ProjectId : String(24) not null;
    ProjectName : String(80) not null;
    @sap.label : 'Object GUID'
    WaveGuid : UUID not null;
    WaveName : String(40) not null;
    @sap.label : 'Status'
    StatusId : String(5) not null;
    @sap.label : 'System status'
    StatusTxt : String(40) not null;
    @sap.label : 'Partner Number'
    WsBusinessPartId : String(32) not null;
    @sap.label : 'Partner Function'
    WsPartnerFct : String(8) not null;
    WsBusinessPartName : String(50) not null;
    @sap.label : 'Object GUID'
    CategoryGuid : UUID not null;
    CategoryName : String(50) not null;
    @sap.label : 'Category ID'
    CategoryId : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_ITRSET {
    @sap.label : 'Object GUID'
    key RefGuid : UUID not null;
    @sap.label : 'Sublandscape ID'
    key ReqReleaseComp : String(22) not null;
    @sap.label : 'Release Number'
    key ReqReleaseNo : String(12) not null;
    @sap.label : 'Sublandscape ID'
    key ActReleaseComp : String(22) not null;
    @sap.label : 'Release Number'
    key ActReleaseNo : String(12) not null;
    @sap.label : 'Client'
    Mandt : String(3) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Go-Live Date'
    ReqGoLiveDate : Timestamp;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Go-Live Date'
    PlndGoLiveDate : Timestamp;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Go-Live Date'
    ActGoLiveDate : Timestamp;
    @sap.label : 'Release GUID'
    RequestedRelease : UUID not null;
    @sap.label : 'Release GUID'
    ForecastRelease : UUID not null;
    @sap.label : 'Release GUID'
    ActualRelease : UUID not null;
    @sap.label : 'ID'
    InitiativeId : String(24) not null;
    @sap.label : 'Project Name'
    SoldocProject : String(10) not null;
    @sap.label : 'Status'
    ReleasePhase : String(5) not null;
    @sap.label : 'Status'
    ReleasePhaseDescr : String(30) not null;
    @sap.label : 'Project Name'
    TestMgtProject : String(10) not null;
    @sap.label : 'Release Status'
    ReleaseStatus : String(20) not null;
    @sap.label : 'Sublandscape ID'
    PlndReleaseComp : String(22) not null;
    @sap.label : 'Release Number'
    PlndReleaseNo : String(12) not null;
    @sap.label : 'Sol. Landscape Name'
    ReqReleaseClass : String(30) not null;
    @sap.label : 'Release Type'
    ReqReleaseType : String(30) not null;
    @sap.label : 'Branch Name'
    ReqReleaseBranch : String(30) not null;
    @sap.label : 'Sol. Landscape Name'
    PlndReleaseClass : String(30) not null;
    @sap.label : 'Release Type'
    PlndReleaseType : String(30) not null;
    @sap.label : 'Branch Name'
    PlndReleaseBranch : String(30) not null;
    @sap.label : 'Sol. Landscape Name'
    ActReleaseClass : String(30) not null;
    @sap.label : 'Release Type'
    ActReleaseType : String(30) not null;
    @sap.label : 'Branch Name'
    ActReleaseBranch : String(30) not null;
    @sap.label : 'Description'
    InitiativeDescr : String(40) not null;
    @sap.label : 'ID'
    PortfolioItem : String(24) not null;
    @sap.label : 'Description'
    PortfolioItemDescr : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTADMINHSET {
    @sap.label : 'Object GUID'
    key Guid : UUID not null;
    @sap.label : 'Changed By'
    ChangedBy : String(12) not null;
    ChangedByDesc : String(80) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    ChangedDate : Timestamp not null;
    @sap.label : 'Conversion'
    conversion : Boolean not null;
    @sap.label : 'Created By'
    CreatedBy : String(12) not null;
    CreatedByDesc : String(80) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    CreatedDate : Timestamp not null;
    @sap.label : 'Description'
    Description : String(40) not null;
    @sap.label : 'Enhancement'
    enh : Boolean not null;
    @sap.label : 'External ID'
    Ext_Id : String(60) not null;
    @sap.label : 'Link for the /SALM/EXT_IDattribute'
    Ext_Link : String not null;
    @sap.label : 'Fit'
    fit : Boolean not null;
    @sap.label : 'Form'
    forms : Boolean not null;
    @sap.label : 'Gap'
    gap : Boolean not null;
    @sap.label : 'Interface'
    interface : Boolean not null;
    @sap.label : 'Local Requirement'
    local : Boolean not null;
    @sap.label : 'Transaction No.'
    ObjectId : String(10) not null;
    @sap.label : 'Number'
    PriorityId : String(1) not null;
    PriorityText : String(132) not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
    @sap.label : 'Report'
    report : Boolean not null;
    RiskLvl : String(3) not null;
    RiskText : String(40) not null;
    @sap.label : 'Risk Strategy'
    RiskStrategy : String(3) not null;
    @sap.label : 'Risk Strategy'
    RiskStrategyText : String(40) not null;
    @sap.label : 'Impact'
    RkImpact : String(2) not null;
    @sap.label : 'Probability'
    RkSeverit : String(2) not null;
    @sap.label : 'Effort Points'
    sortOrd : Integer not null;
    @sap.label : 'Story Point'
    storyPoint : Integer not null;
    @sap.label : 'Value Points'
    storyPt : Integer not null;
    SubType : String not null;
    Type : String(8) not null;
    @sap.label : 'Workflow'
    workflow : Boolean not null;
    @sap.label : 'Classification'
    wricef : String(8) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    StandardChangeFlag : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTCATEGORYSET {
    @sap.label : 'Object GUID'
    key Guid : UUID not null;
    @sap.label : 'Catego. GUID'
    key CatGuid : UUID not null;
    Cat1 : String(50) not null;
    Cat2 : String(50) not null;
    Cat3 : String(50) not null;
    @sap.label : 'String'
    ConcatenatedDescription : String(50) not null;
    Cat4 : String(50) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTPARTNERSET {
    @sap.label : 'Object GUID'
    key RefGuid : UUID not null;
    @sap.label : 'Partner Function'
    key RefPartnerFct : String(8) not null;
    @sap.label : 'Partner ID'
    key RefPartnerNo : String(20) not null;
    @sap.label : 'Object Type'
    RefKind : String(1) not null;
    @sap.label : 'Internal No. Typ'
    RefNoType : String(2) not null;
    @sap.label : 'No. type'
    RefDisplayType : String(2) not null;
    @sap.label : 'Partner origin'
    KindOfEntry : String(1) not null;
    @sap.label : 'Partner Function'
    PartnerFct : String(8) not null;
    @sap.label : 'Partner Number'
    PartnerNo : String(32) not null;
    @sap.label : 'No. type'
    DisplayType : String(2) not null;
    @sap.label : 'Internal No. Typ'
    NoType : String(2) not null;
    @sap.label : 'Main Partner'
    Mainpartner : String(1) not null;
    @sap.label : 'Address Number'
    AddrNr : String(10) not null;
    @sap.label : 'Person number'
    AddrNp : String(10) not null;
    @sap.label : 'Address Type'
    AddrType : String(1) not null;
    @sap.label : 'Address Origi'
    AddrOrigin : String(1) not null;
    @sap.label : 'Stand. address'
    StdBpAddress : Boolean not null;
    @sap.label : 'Transaction'
    AddrOperation : String(6) not null;
    @sap.label : 'No inbox entry'
    Disabled : String(5) not null;
    @sap.label : 'Checkbox'
    ErrorFlag : Boolean not null;
    @sap.label : 'BP GUID'
    BpPartnerGuid : UUID not null;
    @sap.label : 'Function category'
    PartnerPft : String(4) not null;
    @sap.label : 'Usage'
    PftSubtype : String(4) not null;
    @sap.label : 'Partner GUID'
    PartnerGuid : UUID not null;
    @sap.label : 'Object GUID'
    Guid : UUID not null;
    @sap.label : 'Text'
    PartnPftDescr : String(30) not null;
    @sap.label : 'Description'
    DescriptionName : String(50) not null;
    @sap.label : 'Int2'
    ConfigId : Integer not null;
    @sap.label : 'Character Field of Length 12'
    BPartnerType : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTPARTNERF4SET {
    @sap.label : 'Partner ID'
    key RefPartnerNo : String(20) not null;
    @sap.label : 'Description'
    DescriptionName : String(50) not null;
    @sap.label : 'Character Field of Length 12'
    BPartnerType : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity PPF_ACTIONSET {
    key ActionId : String(30) not null;
    key ActionDesc : String(60) not null;
    key WsGuid : String(32) not null;
    ActionUrl : String not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    DigitalSignature : Boolean not null;
  } actions {
    function PPF_ACTION() returns PPF_ACTIONSET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WORKSPACESET {
    @sap.label : 'Object GUID'
    key Guid : UUID not null;
    @sap.label : 'Transaction Type'
    key ProcessType : String(4) not null;
    @sap.label : 'Single-Character Flag'
    Editws : String(1) not null;
    @sap.label : 'Status'
    StatusOverdue : String(5) not null;
    CONFIG_LABEL : String not null;
    risktxt : String not null;
    @sap.label : 'Branch ID'
    BrancheId : String(22) not null;
    @sap.label : 'Int2'
    MaxLines : Integer not null;
    StatusGroupFilter : String not null;
    @sap.label : 'Partner Function'
    PartnerFCT : String(8) not null;
    WsUrl : String not null;
    AssignedTo : String not null;
    @sap.label : 'Transaction Type'
    ProcessTypeTxt : String(60) not null;
    @sap.label : 'ID'
    ObjectId : String(10) not null;
    @sap.label : 'Trans. Category'
    ObjectType : String(10) not null;
    @sap.label : 'Priority'
    PriorityTxt : String(60) not null;
    @sap.label : 'Status'
    Status : String(5) not null;
    @sap.label : 'System status'
    Concatstat : String(40) not null;
    @sap.label : 'User Status'
    Concatstatuser : String(40) not null;
    @sap.label : 'Service Team'
    ServiceTeam : String(10) not null;
    @sap.label : 'Service Group'
    ServiceTeamList : String(80) not null;
    @sap.label : 'Employee Resp.'
    PersonResp : String(10) not null;
    @sap.label : 'Person Responsible'
    PersonRespList : String(80) not null;
    @sap.label : 'Sold-To Party'
    SoldToPartyList : String(80) not null;
    @sap.label : 'Customer'
    SoldToParty : String(10) not null;
    @sap.label : 'Employee Resp.'
    ContactPerson : String(10) not null;
    @sap.label : 'Description'
    Description : String(40) not null;
    @sap.label : 'Category ID'
    CategoryId : String(40) not null;
    @sap.label : 'Category'
    CategoryTxt : String(60) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Category_Editability : Boolean not null;
    @sap.label : 'Created By'
    CreatedBy : String(12) not null;
    @sap.label : 'Object Type'
    RefObjectType : String(1) not null;
    @sap.label : 'Product ID'
    RefProductId : String(40) not null;
    @sap.label : 'Description'
    RefTextObject : String(40) not null;
    @sap.label : 'Description'
    RefTextIbComp : String(40) not null;
    @sap.label : 'Object Key'
    ObjectKey : String(100) not null;
    @sap.label : 'Service Organization'
    ServiceOrg : String(14) not null;
    @sap.label : 'Sales Org. ID'
    SalesOrg : String(14) not null;
    @sap.label : 'Lock Status'
    LockStatus : String(1) not null;
    @sap.label : 'Locked'
    StatLock : String(1) not null;
    @sap.label : 'Dummy'
    EewRSrviDummy : String(1) not null;
    @sap.label : 'Dummy'
    EewRSrvpDummy : String(1) not null;
    @sap.label : 'Dummy'
    EewRRfcDummy : String(1) not null;
    @sap.label : 'Territory ID'
    TerrId : String(30) not null;
    @sap.label : 'Terr. Desc'
    TerrDescrip : String(40) not null;
    @sap.label : 'Ranking Fix Val'
    WpFixval : Decimal(5, 0) not null;
    @sap.label : 'Ranking'
    WorkPriority : Decimal(5, 0) not null;
    @sap.label : 'Attachment'
    Attachment : String(1) not null;
    @sap.label : 'Release Number'
    ActualReleaseNo : String(32) not null;
    @sap.label : 'Release Class'
    ActualReleaseClass : String(10) not null;
    @sap.label : 'Release Type'
    ActualReleaseType : String(10) not null;
    @sap.label : 'Release Number'
    RequestedReleaseNo : String(32) not null;
    @sap.label : 'Release Class'
    RequestedReleaseClass : String(10) not null;
    @sap.label : 'Release Type'
    RequestedReleaseType : String(10) not null;
    @sap.label : 'Release Number'
    ForecastReleaseNo : String(32) not null;
    @sap.label : 'Release Class'
    ForecastReleaseClass : String(10) not null;
    @sap.label : 'Release Type'
    ForecastReleaseType : String(10) not null;
    @sap.label : 'Partner Number'
    EmpRespName : String(32) not null;
    @sap.label : 'Partner Number'
    ServiceUnitName : String(32) not null;
    @sap.label : 'Partner Number'
    ExecSrvEmpName : String(32) not null;
    @sap.label : 'Partner Number'
    ChangeManager : String(32) not null;
    @sap.label : 'Partner Number'
    ShipToReturnsName : String(32) not null;
    @sap.label : 'Partner Number'
    ShiptoName : String(32) not null;
    Config_id : String not null;
    @sap.label : 'Partner Number'
    BilltoName : String(32) not null;
    BTTEXTSet : Association to many BTTEXTSET {  };
    SCOPE_PROCESSTYPESSet : Association to many SCOPE_PROCESSTYPESSet {  };
    SCOPE_PARTNERSSet : Association to many SCOPE_PARTNERSSet {  };
    PartnerFCT_F4Set : Association to many PartnerFCT_F4Set {  };
    BT_CHECKLISTSet : Association to many BT_CHECKLISTSET {  };
    BT_TRANSPORTREQSet : Association to many BT_TRANSPORTREQSET {  };
    WS_SoldocSet : Association to many SoldocSet {  };
    PROCESS_TYPESet : Association to many PROCESS_TYPESet {  };
    BTREFOBJMAIN : Association to BTREFOBJMAINSet {  };
    WS_CUSTOMERHSet : Association to many CUSTOMER_HSet {  };
    BTTESTCASESet : Association to many BTTESTCASESet {  };
    WS_BTSRVREQUESTHSet : Association to BTSRVREQUESTHSet {  };
    BT_TWBSet : Association to many BT_TWBSet {  };
    RELATEDTRANSFields : Association to RELATEDTRANSFieldsSet {  };
    BTADMINH : Association to BTADMINHSET {  };
    PPF_ACTIONSet : Association to many PPF_ACTIONSET {  };
    BTPARTNERSet : Association to many BTPARTNERSET {  };
    BTCATEGORY : Association to BTCATEGORYSET {  };
    BTPARTNERF4 : Association to BTPARTNERF4SET {  };
    BT_ITR : Association to BT_ITRSET {  };
    BT_ITPPM : Association to BT_ITPPMSET {  };
    BTCATEGORYf4 : Association to BTCATEGORYf4SET {  };
    BTSCOPESet : Association to many BTSCOPESET {  };
    BTDATESSet : Association to many BTDATESSet {  };
    BT_RELATEDTRANSSet : Association to many BT_RELATEDTRANSSET {  };
    BT_EFFORTSet : Association to many BT_EFFORTSET {  };
    DETAILSET : Association to many DETAILSET {  };
    BT_EFFORTACTUALSet : Association to many BT_EFFORTACTUALSET {  };
    WAVEF4Set : Association to many WAVEF4SET {  };
    SCOPE_COMPONENTSSet : Association to many SCOPE_COMPONENTSSet {  };
    WS_SYSLOGONSet : Association to many WS_SYSLOGONSET {  };
    CHECKLIST_SHSet : Association to many CHECKLIST_SHSet {  };
    SPRINTF4Set : Association to many SPRINTF4Set {  };
    WS_ENABLEMENTSet : Association to many WS_ENABLEMENTSet {  };
    WS_BTDOCFLOWDEFECTCORRSet : Association to BTDOCFLOWDEFECTCORRSet {  };
    BTServiceLevel : Association to BTServiceLevelSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_ITPPMSET {
    @sap.label : 'Object GUID'
    key RefGuid : UUID not null;
    @sap.label : 'Appl. GUID'
    key ProjectGuid : UUID not null;
    @sap.label : 'Number'
    key ProjectId : String(24) not null;
    @sap.label : 'Client'
    Client : String(3) not null;
    @sap.label : 'Appl. GUID'
    ProjPhaseGuid : UUID not null;
    CompPerc : String(4) not null;
    ProjPhaseText : String(40) not null;
    PpmUrl : String not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Start Date'
    StartDate : Timestamp;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Finish Date'
    FinishDate : Timestamp;
    @sap.label : 'Percent Completion'
    Completion : String(3) not null;
    @sap.label : 'Appl. GUID'
    RequestedPhase : UUID not null;
    @sap.label : 'Appl. GUID'
    PhaseLevel1 : UUID not null;
    @sap.label : 'Appl. GUID'
    PhaseLevel2 : UUID not null;
    @sap.label : 'Appl. GUID'
    PhaseLevel3 : UUID not null;
    @sap.label : 'Text'
    ProjectName : String(80) not null;
    @sap.label : 'Description'
    ProjectPhase : String(40) not null;
    @sap.label : 'Appl. GUID'
    TaskGuid : UUID not null;
    @sap.label : 'Number'
    TaskId : String(24) not null;
    @sap.label : 'Text'
    TaskName : String(80) not null;
    @sap.label : 'Description'
    TaskDura : String(20) not null;
    @sap.label : 'Text'
    TaskDuraUnit : String(80) not null;
    @sap.label : 'Description'
    EstimatedWork : String(20) not null;
    @sap.label : 'Text'
    EstimatedWorkUnit : String(80) not null;
    @sap.label : 'Description'
    PlannedWork : String(20) not null;
    @sap.label : 'Text'
    PlannedWorkUnit : String(80) not null;
    @sap.label : 'Description'
    TotalWork : String(20) not null;
    @sap.label : 'Text'
    TotalWorkUnit : String(80) not null;
    TaskUrl : String not null;
    @sap.label : 'Single-Character Flag'
    PpmProjMod : String(1) not null;
    @sap.label : 'Test Classification'
    Classification : String(30) not null;
    @sap.label : 'Text'
    ClassificationText : String(100) not null;
    SPRINTF4Set : Association to many SPRINTF4Set {  };
    PROJECT_PHASESet : Association to many PROJECT_PHASE_F4Set {  };
    WAVEF4Set : Association to many WAVEF4SET {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ATTRIBUTESF4SET {
    key ![KEY] : String(8) not null;
    GUID : String(32) not null;
    VALUE : String(80) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTSCOPESET {
    key WpGuid : String(32) not null;
    key WpItemGuid : String(32) not null;
    WpType : String(40) not null;
    WpDescription : String(40) not null;
    WpSystem : String(12) not null;
    WpScope : String(40) not null;
    WpStatus : String(30) not null;
    ProcTypeDesc : String(20) not null;
    Sprint : String(32) not null;
    Wricef : String(80) not null;
    @sap.label : 'Component'
    IbaseInstance : String(18) not null;
    @sap.label : 'Case-Sensitive Length 1024'
    Text : String(1024) not null;
    @sap.label : 'Indicator'
    Changeable : Boolean not null;
    Url : String not null;
    @sap.label : 'Classification'
    WricefKey : String(8) not null;
    @sap.label : 'Product ID'
    ConfigItem : String(40) not null;
    CmpDesc : String(40) not null;
    SCOPE_PARTNER_FCTSet : Association to many SCOPE_PARTNER_FCTSet {  };
    SCOPE_COMPONENTSet : Association to many SCOPE_COMPONENTSSet {  };
    BTSCOPE_PARTNERSSet : Association to many BTSCOPE_PARTNERSSet {  };
    SCOPE_WRICEFSet : Association to many SCOPE_WRICEFSet {  };
    SCOPE_DOCSet : Association to many SCOPE_DOCSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTDATESSet {
    @sap.label : 'GUID of Appointment'
    key ApptGuid : UUID not null;
    @sap.label : 'Date Type'
    key ApptType : String(12) not null;
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    @sap.label : 'Time stamp'
    TimestampTo : Decimal(15, 0) not null;
    @sap.label : 'Time Stamp'
    TimestampFrom : Decimal(15, 0) not null;
    @sap.label : 'Time zone from'
    TimezoneFrom : String(6) not null;
    @sap.label : 'Time zone to'
    TimezoneTo : String(6) not null;
    @sap.label : 'Rule ID'
    RuleGuid : LargeBinary not null;
    @sap.label : 'Rule Name'
    RuleName : String(12) not null;
    @sap.label : 'Name'
    ApptTypeDescr : String(40) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.display.format : 'Date'
    @sap.label : 'From Date'
    Fromdate : Timestamp;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'End Date'
    Todate : Timestamp;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    KfSrvRready : String(1) not null;
    @sap.label : 'Int2'
    ConfigId : Integer not null;
    @sap.label : 'Single-Character Flag'
    Disabled : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ReleaseNoF4Set {
    @sap.label : 'id'
    key Id : String not null;
    ReleaseCrmDescription : String not null;
    @sap.label : 'Client'
    Client : String(3) not null;
    @sap.label : 'Sublandscape ID'
    ReleaseComponent : String(22) not null;
    @sap.label : 'Release Number'
    ReleaseNumber : String(12) not null;
    @sap.label : 'Cycle Type'
    ReleaseType : String(1) not null;
    @odata.Type : 'Edm.DateTime'
    @odata.Precision : 7
    @sap.label : 'Go-Live Date'
    GoliveDate : Timestamp not null;
    @sap.label : 'Change'
    GolivePostponed : Boolean not null;
    @sap.label : 'Cycle'
    SmiProject : String(10) not null;
    @sap.label : 'Object GUID'
    ReleaseCrmGuid : UUID not null;
    @sap.label : 'Transaction No.'
    ReleaseCrmId : String(10) not null;
    @sap.label : 'Task List ID'
    TasklistId : String(10) not null;
    @sap.label : 'Branch ID'
    BranchId : String(22) not null;
    @sap.label : 'Release Status'
    ReleaseStatus : String(20) not null;
    @sap.label : 'Release Number'
    MajorPredRel : String(12) not null;
    @sap.label : 'Release Number'
    MinorPredRel : String(12) not null;
    @sap.label : 'Release Number'
    CustomerRelease : String(12) not null;
    @sap.label : 'User name'
    CreatedBy : String(12) not null;
    @sap.label : 'User name'
    ChangedBy : String(12) not null;
    @sap.label : 'Delete'
    DeleteFlag : Boolean not null;
    @sap.label : 'Description'
    ReleaseCycleDescription : String not null;
    WsGuid : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WAVEF4SET {
    @sap.label : 'Object GUID'
    key WaveGuid : UUID not null;
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    WaveDescription : String(40) not null;
    WsType : String(4) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_RELATEDTRANSSET {
    key WsGuid : String(32) not null;
    key WsTransGuid : String(32) not null;
    PartnerFct : String(8) not null;
    StatusId : String(5) not null;
    TextComment : String not null;
    PriorityText : String(40) not null;
    PriorityId : String(1) not null;
    EnableDelete : String(1) not null;
    Relation : String(60) not null;
    IsSearch : String(1) not null;
    PartnerId : String(32) not null;
    ObjectId : String(10) not null;
    Description : String(40) not null;
    WsType : String(40) not null;
    CreatedBy : String(80) not null;
    Link : String not null;
    ProjGuid : String(32) not null;
    WaveGuid : String(32) not null;
    Category : String(50) not null;
    Status : String(30) not null;
    WpOwner : String(50) not null;
    WsProcessType : String(4) not null;
    TextDescription : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_EFFORTSET {
    @sap.label : 'Work Package ID'
    key WsGuid : String(32) not null;
    @sap.label : 'Effort type (Planned, Actual)'
    key EffortType : String(7) not null;
    key EffortId : String(32) not null;
    @sap.label : 'Activate or de-activate the row'
    EffortEnabled : String(5) not null;
    @sap.label : 'Role ID'
    EffortRoleId : String(3) not null;
    @sap.label : 'Role'
    EffortRole : String(40) not null;
    @sap.label : 'Note'
    EffortNote : String(40) not null;
    @sap.label : 'Integer'
    EffortDuration : Integer not null;
    @sap.label : 'unit id'
    EffortUnitId : String(3) not null;
    @sap.label : 'Unit'
    EffortUnit : String(10) not null;
    @sap.label : 'From'
    EffortFrom : String(16) not null;
    @sap.label : 'To'
    EffortTo : String(16) not null;
    User : String(32) not null;
    BpId : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_CHECKLISTSET {
    key ChecklistGuid : String(8) not null;
    @sap.label : 'UUID'
    key WsGuid : UUID not null;
    @sap.label : 'UUID'
    key StepGuid : UUID not null;
    PredId : String(32) not null;
    StepId : String(8) not null;
    Step : String(40) not null;
    RoleId : String(8) not null;
    OldRoleid : String(8) not null;
    Role : String(30) not null;
    Plan : String(16) not null;
    OldPlan : String(16) not null;
    Actual : String(16) not null;
    OlduserId : String(32) not null;
    UserId : String(32) not null;
    UserName : String(50) not null;
    StatusId : String(5) not null;
    StatusName : String(30) not null;
    Enabled : String(5) not null;
    Comment : String not null;
    CHECKLIST_STATUSSet : Association to many CHECKLIST_STATUSSet {  };
    CHECKLIST_BPSet : Association to many CHECKLIST_BPSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity TEXT_TYPEF4SET {
    @sap.label : 'text type ID'
    key TypeId : String(4) not null;
    @sap.label : 'Changeable text type'
    Changeable : String(1) not null;
    @sap.label : 'type name'
    TypeName : String(30) not null;
    TransactionType : String(4) not null;
    ConfigId : Integer not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    RichText : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BUSINESS_PARTNERSET {
    @sap.label : 'Partner Number'
    key Partner : String(20) not null;
    @sap.label : 'Person or organization'
    PartnerType : String(12) not null;
    @sap.label : 'First name'
    FirstName : String(40) not null;
    @sap.label : 'Last name'
    LastName : String(40) not null;
    @sap.label : 'Partner GUID'
    PartnerGuid : String(32) not null;
    @sap.label : 'Partner Function'
    Role : String(6) not null;
    @sap.label : 'CRM GUID'
    WsGuid : String(32) not null;
    @sap.label : 'Partner Number'
    RefPartner : String(20) not null;
    @sap.label : 'Partner Function'
    RefPartnerFct : String(8) not null;
    @sap.label : 'Partner Function'
    PartnerFct : String(8) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RELATED_TYPESET {
    key TypeId : String(10) not null;
    TypeName : String(60) not null;
    WsGuid : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_EFFORTACTUALSET {
    @sap.label : 'Work Package ID'
    key WsGuid : String(32) not null;
    @sap.label : 'Effort type (Planned, Actual)'
    key EffortType : String(7) not null;
    key EffortId : String(32) not null;
    @sap.label : 'Activate or de-activate the row'
    EffortEnabled : String(5) not null;
    @sap.label : 'Role ID'
    EffortRoleId : String(3) not null;
    @sap.label : 'Role'
    EffortRole : String(40) not null;
    @sap.label : 'Note'
    EffortNote : String(40) not null;
    @sap.label : 'Integer'
    EffortDuration : Integer not null;
    @sap.label : 'unit id'
    EffortUnitId : String(3) not null;
    @sap.label : 'Unit'
    EffortUnit : String(10) not null;
    @sap.label : 'From'
    EffortFrom : String(16) not null;
    @sap.label : 'To'
    EffortTo : String(16) not null;
    User : String(32) not null;
    BpId : String(32) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ROLESET {
    key ActivityNo : String(3) not null;
    Activity : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity TIME_UNITSET {
    key UnitNo : String(3) not null;
    Unit : String(10) not null;
    FilterUnit : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity SCOPE_COMPONENTSSet {
    @sap.label : 'Work Item ID'
    key WpGuid : String(32) not null;
    @sap.label : 'System ID'
    key SystemId : String(8) not null;
    @sap.label : 'Client number'
    key SystemClient : String(3) not null;
    @sap.label : 'Installed Base'
    key Ibase : String(18) not null;
    @sap.label : 'Object GUID'
    key ItemGuid : UUID not null;
    @sap.label : 'Product ID'
    key ConfigItem : String(40) not null;
    @sap.label : 'System Description'
    SystemDescription : String(40) not null;
    @sap.label : 'Component'
    IbaseInstance : String(18) not null;
    @sap.label : 'Transaction Type'
    ProcessType : String(4) not null;
    ProdDescription : String(40) not null;
    ObjectFamily : String(4) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    SystemSwitch : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_SYSLOGONSET {
    key WsGuid : String(32) not null;
    key SysRole : String not null;
    key System : String(8) not null;
    key Client : String(3) not null;
    key TransportTrack : String(8) not null;
    Url : String not null;
    DevSys : String(5) not null;
    TrStatus : String not null;
    TrNumRisk : String not null;
    TrRiskStatus : String(2) not null;
    TrRiskIcon : String(30) not null;
    Relevant : String(1) not null;
    SysRoleId : String(1) not null;
    SysType : String(16) not null;
  } actions {
    function SYSTEM_LOGON_ACT(
      SysRoleId : String,
      SysType : String
    ) returns many WS_SYSLOGONSET;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CHECKLIST_STATUSSet {
    key StatusId : String(5) not null;
    @sap.label : 'Object GUID'
    key StepGuid : UUID not null;
    @sap.label : 'Object GUID'
    WsGuid : UUID not null;
    PredStatusId : String(5) not null;
    CurrentStatusId : String(5) not null;
    StatusName : String(30) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CHECKLIST_BPSet {
    key WsGuid : String(32) not null;
    key StepGuid : String(32) not null;
    ChecklistId : String(8) not null;
    NewBpid : String(20) not null;
    NewBpname : String(50) not null;
    NewBpfct : String(8) not null;
    OldBpid : String(20) not null;
    OldBpname : String(50) not null;
    OldBpfct : String(8) not null;
    Mainpartner : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CHECKLIST_SHSet {
    key ChecklistId : String(8) not null;
    @sap.label : 'Object GUID'
    key WsGuid : UUID not null;
    Description : String(40) not null;
    Selected : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_ENABLEMENTSet {
    key FieldName : String(30) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    Editable : String(1) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CHECKLIST_BP_FCTSet {
    key FCT_ID : String(40) not null;
    WS_GUID : String(32);
    FCT_DESCRIPTION : String(80);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_USERSET {
    key UserId : String(12) not null;
    UserName : String(50) not null;
    WS_FILTERSet : Association to many WS_FILTERSET {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_RiskSet {
    @sap.label : 'Char'
    key ![Key] : String(40) not null;
    @sap.label : 'Text'
    Value : String(132) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTREFOBJMAINSet {
    key Guid : String(32) not null;
    key ConfigItem : String(40) not null;
    SystemId : String(3) not null;
    @sap.label : 'Boolean Variable (X=True, -=False, Space=Unknown)'
    SystemSwitch : String(1) not null;
    SystemClient : String(3) not null;
    SystemDescription : String(40) not null;
    IbaseInstance : String(18) not null;
    Ibase : String(18) not null;
    ItemGuid : String(32) not null;
    ProdDescription : String(40) not null;
    ObjectFamily : String(4) not null;
    SystemType : String(3) not null;
    Config_Label : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CUSTOMER_HSet {
    key WS_GUID : String(32) not null;
    key FIELD_ID : String(30) not null;
    FIELD_NAME : String(60) not null;
    FIELD_VALUE : String(30);
    @sap.label : 'Signed INT2 / int16'
    ConfigId : Integer not null;
    FIELD_TYPE : String(12) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_SrvProfileSet {
    key Guid : String(32) not null;
    @sap.label : 'Service Profile'
    SrvSerwi : String(10) not null;
    @sap.label : 'Language'
    Langu : String(2) not null;
    @sap.label : 'Description'
    ServProfileTxt : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity WS_RespProfileSet {
    key Guid : String(32) not null;
    @sap.label : 'Response Prof.'
    SrvEscal : String(10) not null;
    @sap.label : 'Language'
    Langu : String(2) not null;
    @sap.label : 'Description'
    RespProfiileTxt : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BTDOCFLOWDEFECTCORRSet {
    key WsGuid : String(32) not null;
    ObjectId : String(10) not null;
    Description : String(40) not null;
    Link : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity CUSTOMER_H_F4Set {
    key FIELD_ID : String not null;
    key ![KEY] : String(10) not null;
    VALUE : String(60) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RISK_IMPACT_F4Set {
    key ID : String(2) not null;
    VALUE : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity RISK_PROBABILITY_F4Set {
    key ID : String(2) not null;
    VALUE : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_TWBSet {
    key CrmDocumentGuid : String(32) not null;
    key TwbNodeId : String(35) not null;
    key TwbNodeParentId : String(35) not null;
    key Guid : String(32) not null;
    TwbClassification : String(30) not null;
    TwbClassificationText : String(100) not null;
    TwbNodeText : String(100) not null;
    TcInitialNum : String(10) not null;
    TwbParentText : String(100) not null;
    StatusAction : String(10) not null;
    TplnUrl : String not null;
    TwbNodeUrl : String not null;
    Type : String(8) not null;
    TpckUrl : String not null;
    TwbNodeParentUrl : String not null;
    TypeText : String(30) not null;
    Status : String(30) not null;
    TcErrorNum : String(10) not null;
    TcSuccNum : String(10) not null;
    TpckId : String(35) not null;
    TpckText : String(100) not null;
    TplnId : String(35) not null;
    TplnText : String(100) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity BT_TWB_F4Set {
    @sap.label : 'Test Plan ID'
    key TestPlan_ID : String(35) not null;
    @sap.label : 'Test Package ID'
    key TestPackage_ID : String(35) not null;
    @sap.label : 'Full Name'
    BpFullName : String(80) not null;
    @sap.label : 'Test Plan Description'
    TestPlan_Desc : String(100) not null;
    @sap.label : 'Test Plan Description'
    TestPackage_Desc : String(100);
    @sap.label : 'Person Responsible'
    BP_Resp : String(10) not null;
    @sap.label : 'Contxt Typ'
    Type : String(8) not null;
    @sap.label : 'Solution Name'
    Solution_Name : String(50) not null;
    @sap.label : 'Branch Name'
    Branch_Name : String(30) not null;
    @sap.label : 'Int2'
    MAX_LINES : Integer not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity EXEC_DIGITAL_SIGNSet {
    key Comment : String not null;
    key Password : String not null;
    key User : String not null;
    WsGuid : String not null;
    Result : String not null;
  } actions {
    function EXEC_DIGITAL_SIGN(
      WsGuid : String
    ) returns EXEC_DIGITAL_SIGNSet;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ApprovalStepSet {
    key StepID : String(10) not null;
    ApprovalProcedure : String(40) not null;
    StepDescription : String(40) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  entity ApprovalActionSet {
    key ID : String(10) not null;
    Description : String(40) not null;
    APRV_STATUS_PF : String(8) not null;
  };
};

