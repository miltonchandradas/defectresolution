/* checksum : 3e8cb934d5cc63a522d7c2a40961c8d9 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service DROP_DOC_SRV {
  @cds.external : true
  @cds.persistence.skip : true
  @sap.content.version : '1'
  @sap.label : 'Content of SolDoc document'
  entity DocumentContentCollection {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MimeType : String not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Signature data of SolDoc document'
  entity DocumentSignatureSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocumentSignatureId : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AuthGroupId : String(8) not null;
    @sap.unicode : 'false'
    @sap.label : 'SMUD Node Object Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjType : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'New password'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Password : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AuthGroupName : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Comment : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Message : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    UserId : String(12) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Timestamp : String(15) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity DocumentCategorySet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TestCaseClassificationId : String(3) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestCaseClassificationValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsSeletced : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity TestCaseClassificationSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key TestCaseClassificationId : String(3) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    TestCaseClassificationValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsSeletced : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity LanguageSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key LanguageId : String(1) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LanguageText : String(16) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LanguageIsoValue : String(2) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsPrimary : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'CRM Object'
  entity CharmWP_WI_BRSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CrmType : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SolutionId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BranchName : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SolDocPath : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureAssignmentPermitted : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    OnlyAssignmentPermitted : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'User status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CrmStatusKey : String(5) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsAutoDocCreationAsked : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SolutionName : String(50) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AttachmentsNotChangeable : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsKpiEnabled : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Message : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ScopeIds : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ContentLanguage : String(1) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ContentLanguageIso : String(2) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    RequestKpiTime : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Description : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsChangeDocument : Boolean not null;
    relevantStructures : Association to many RelevantStructureSet {  };
    requiredStructuresKpi : Association to many RelevantStructureSet {  };
    missingDocuments : Association to many DocumentSet {  };
    usageOfAttachments : Association to many DocumentSet {  };
    soldocLanguages : Association to many LanguageSet {  };
    attachedDeltaDocuments : Association to many DocumentSet {  };
    requiredDocuments : Association to many RequiredDocumentTypeStatusSet {  };
    relevantStructuresChange : Association to many RelevantStructureSet {  };
    allStructureAssignments : Association to many RelevantStructureSet {  };
  } actions {
    action ScopeExtensionChanges() returns many ScopeExtensionChangedElement;
    function DocumentKpiStatus() returns DocKpiStatus;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity RelevantStructureSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementType : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Branchname'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BranchName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Element Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureType : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'Structure'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Link to SolDoc'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectLink : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectOrigin : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessScenario : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessProcess : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LibaryName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsDeleteable : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeStatus : String not null;
    @sap.unicode : 'false'
    @sap.label : 'POSITIVE, NEGATIVE, NEUTRAL or ERROR'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ConflictStatus : String(10) not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsStructureDeleteable : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Scope'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ScopeName : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    ContentLanguage : String(16) not null;
    requiredDocumentsKpi : Association to many RequiredDocumentTypeStatusSet {  };
    usageOfDocuments : Association to many DocumentSet {  };
    documents : Association to many DocumentSet {  };
    allStatus : Association to many DocumentStatusSet {  };
    documentsChange : Association to many DocumentSet {  };
    allDocumentAssignments : Association to many DocumentSet {  };
  } actions {
    action HiddenTestCasesExist() returns HiddenTestCasesReturn;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'DropDoc-relevant SolDoc document'
  entity DocumentSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    weblink : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentVersionId : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'Assign'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Assigned : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Assignment permitted'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AssignmentPermitted : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Link to SolDoc'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectLink : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Branch Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Branchname : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Busiiness Process'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessProcess : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Business Scenario'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BusinessScenario : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Created By'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    CreateAuthor : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Created On'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    CreateDate : String(14) not null;
    @sap.unicode : 'false'
    @sap.label : 'Description'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Description : String not null;
    @sap.unicode : 'false'
    @sap.label : 'SMUD Node Object Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjType : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type Code'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocType : String(26) not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    DocTypeValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentBranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentGroupKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DownloadPath : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Element : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Element Type Code'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementType : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Element Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    ElementTypeValue : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Element'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    ElementValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Filecontent : LargeBinary not null;
    @sap.unicode : 'false'
    @sap.label : 'Filename'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Filename : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Filesize'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Filesize : Integer not null;
    @sap.unicode : 'false'
    @sap.label : 'Filetype'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Filetype : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Origin'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    IsAtCurrentStructure : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Language'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Language : String(16) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed By'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    LastAuthor : String(12) not null;
    @sap.unicode : 'false'
    @sap.label : 'Changed At'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    LastChangeDate : String(14) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LibaryName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Locked'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Locked : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Mimetype'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MimeType : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Object Name'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectOrigin : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Priority'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Priority : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Relevant'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    Relevant : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SearchGlobal : Boolean not null;
    @sap.unicode : 'false'
    @sap.label : 'Status Code'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Status : String(15) not null;
    @sap.unicode : 'false'
    @sap.label : 'Status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    StatusValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureType : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Schema : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Deleteable : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    UpdateMethod : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentCategoryId : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Change Status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeStatus : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    OwnerId : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ResponsibleId : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AdditionalProperties : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Conflict'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ConflictStatus : String(10) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    RealStructureId : String not null;
    documentTypes : Association to many DocTypeValueHelpSet {  };
    documentContent : Association to DocumentContentCollection {  };
    documentTestCaseClassifications : Association to many TestCaseClassificationSet {  };
    documentStatus : Association to many DocumentStatusSet {  };
    documentGroups : Association to many DocumentGroupSet {  };
    documentAuthGroups : Association to many AuthorizationGroupSet {  };
    documentSignatures : Association to many DocumentSignatureSet {  };
    documentAuthorizations : Association to many DocumentAuthorizationSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity RequiredDocumentTypeStatusSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocumentTypeStatusId : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocTypeValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key Kpi : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    RequiredDocType : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentName : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Availability : Boolean;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CurrentStatus : String;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    KpiText : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Rating : Boolean;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ExpectedStatusKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ExpectedStatus : String;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    OverallRelevant : Boolean not null;
    statusDetailsUnderStructure : Association to many RequiredDocumentTypeStatusSet {  };
    statusDetailsUnderDocument : Association to many RequiredDocumentTypeStatusSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Status data of SolDoc document'
  entity DocumentStatusSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key SchemaKey : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Document Status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StatusKey : String(15) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SchemaValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StatusValue : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    SignatureRequired : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Error : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ErrorMessage : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectTypeKey : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Value Help Entry for Doc Type in Document Creation popup'
  entity DocTypeValueHelpSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeValue : String not null;
    @sap.unicode : 'false'
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsAvailable : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ProcessType : String not null;
    elementTypes : Association to many ElementTypeValueHelpSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Value Help Entry for Element Type in Document Creation popup'
  entity ElementTypeValueHelpSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ElementTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementTypeValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    elements : Association to many ElementValueHelpSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Value Help Entry for Element in Document Creation popup'
  entity ElementValueHelpSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ElementTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key ElementKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Source : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Node group of SolDoc element'
  entity DocumentGroupSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentGroupKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentGroupValue : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeKey : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Action : String not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementTypeKey : String not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity SoldocNodeSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    soldocDocuments : Association to many DocumentSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity AuthorizationGroupSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key AuthGroupId : String(8) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'New doc status requiring signature'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    NextStatusKey : String(15) not null;
    @sap.unicode : 'false'
    @sap.label : 'SMUD Node Object Type'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    ObjType : String(26) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AuthGroupName : String(40) not null;
    @sap.unicode : 'false'
    @sap.label : 'This user already signed'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CancelOnly : Boolean not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ErrorMessage : String(80) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  entity DocumentAuthorizationSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key StructureId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key DocId : String(32) not null;
    @sap.unicode : 'false'
    @sap.label : 'e.g. _SMD_RESPONSIBLE or TEAMMEMBERID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    key RoleKey : String(25) not null;
    @sap.unicode : 'false'
    @sap.label : 'Reason, if changing property RoleKey is not possible'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    RejectionReason : String;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    BusinessPartnerId : String(10);
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FirstName : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    LastName : String(40) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    FullName : String;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Email : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Source Work Item of a Move Operation'
  entity MoveSourceSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key SourceCrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.label : 'Target CrmObjects of Move Operation'
    targets : Association to many MoveTargetSet {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @sap.updatable : 'false'
  @sap.deletable : 'false'
  @sap.pageable : 'false'
  @sap.addressable : 'false'
  @sap.content.version : '1'
  @sap.label : 'Target Work Iteem of a Move Operation'
  entity MoveTargetSet {
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key CrmId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    key BranchId : String(32) not null;
    @sap.unicode : 'false'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    MoveElementIds : String not null;
  };

  @cds.external : true
  type ScopeExtensionChangedElement {
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    CrmId : String(32) not null;
    @sap.label : 'ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    BranchId : String(22) not null;
    @sap.label : 'ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureId : String(22) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ObjectName : String not null;
    @sap.label : 'ID'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ParentStructure : String(22) not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocId : String not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocumentVersionId : String not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocType : String not null;
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocTypeValue : String not null;
    @sap.label : 'N = New, U = Updated'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ChangeStatus : String(1) not null;
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Assigned : Boolean not null;
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    IsStructure : Boolean not null;
  };

  @cds.external : true
  type DocAutoCreationStatus {
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    AutoCreationAvailable : Boolean not null;
  };

  @cds.external : true
  type AllowedElementType {
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    ElementTypeId : String not null;
    @sap.label : 'Indicator'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Selectable : Boolean not null;
  };

  @cds.external : true
  type HiddenTestCasesReturn {
    @sap.label : '''X''=yes, else no'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    HiddenTestCasesExist : Boolean not null;
    @sap.label : 'Message'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Message : String not null;
  };

  @cds.external : true
  type DocKpiStatus {
    @sap.label : 'POSITIVE, NEGATIVE, NEUTRAL or ERROR'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    DocKpiStatusOverall : String(10) not null;
    @sap.label : 'Description of KPI Overall Status'
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    Message : String not null;
  };

  @cds.external : true
  type AssignedStructureId {
    @sap.creatable : 'false'
    @sap.updatable : 'false'
    @sap.sortable : 'false'
    @sap.filterable : 'false'
    StructureId : String not null;
  };

  @cds.external : true
  action DocumentAutoCreationStatus(
    CrmId : String(32),
    BranchId : String(32),
    StructureIds : String
  ) returns DocAutoCreationStatus;

  @cds.external : true
  function GetAllowedElementTypes() returns many AllowedElementType;

  @cds.external : true
  action DiagramAssignStructures(
    CrmId : String(32),
    BranchId : String(32),
    StructureId : String(32),
    StructureType : String(26)
  ) returns many AssignedStructureId;
};

