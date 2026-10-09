/* checksum : 52b563d06fee938923f466480206c065 */
@cds.external : true
@Aggregation.ApplySupported.Transformations : [ 'aggregate', 'groupby', 'filter' ]
@Aggregation.ApplySupported.Rollup : #None
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.Signature : true
@PDF.Features.HeaderFooter : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service ZSB_AI_REVIEW_RUN_V4 {
  @cds.external : true
  type SAP__Message {
    code : String not null;
    message : String not null;
    target : String;
    additionalTargets : many String not null;
    transition : Boolean not null;
    @odata.Type : 'Edm.Byte'
    numericSeverity : Integer not null;
    longtextUrl : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Consumption view for ZI_ABAP_REVIEW_RUN'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    { NavigationProperty: _Bugs, InsertRestrictions: { Insertable: true } }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity ABAPReviewRuns {
    @Common.Label : 'UUID'
    @Common.QuickInfo : '16 Byte UUID in 16 Bytes (Raw Format)'
    key RunId : UUID not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Changed On'
    @Common.QuickInfo : 'Last Change Date Time'
    CreatedAt : Timestamp;
    @Common.IsUpperCase : true
    @Common.Label : 'User Name'
    @Common.Heading : 'User'
    CreatedBy : String(12) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'User Name'
    @Common.Heading : 'User'
    LastChangedBy : String(12) not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Changed On'
    @Common.QuickInfo : 'Last Change Date Time'
    LastChangedAt : Timestamp;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Common.Label : 'Changed On'
    @Common.QuickInfo : 'Local Instance Last Change Date Time'
    LocalLastChangedAt : Timestamp;
    Name : String(255) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Review Status'
    @Common.Heading : 'ABAP Review Status'
    @Common.QuickInfo : 'Data element for ZAI_REVIEW_STATUS_D domain'
    Status : String(20) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Trigger Source'
    @Common.QuickInfo : 'Data element for ZAI_REVIEW_TRIGGER_SRC_D domain'
    TriggerSource : String(20) not null;
    LlmModel : String(255) not null;
    MaxTokens : Integer not null;
    InputTokens : Integer not null;
    OutputTokens : Integer not null;
    TotalTokens : Integer not null;
    EmailRecipient : String(255) not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    EmailSent : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    BugHigh : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    BugMedium : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    BugAll : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    BugLow : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    FunctionalDoc : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    TechnicalDoc : Boolean not null;
    ErrorText : String(255) not null;
    SAP__Messages : many SAP__Message not null;
    @Common.Composition : true
    _Bugs : Composition of many Bugs on _Bugs._Run = $self;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Consumption view for ZI_ABAP_REVIEW_BUG'
  @Common.Messages : SAP__Messages
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: AffectedArea, AllowedExpressions: 'SearchExpression' },
    {
      Property: BusinessProcessContext,
      AllowedExpressions: 'SearchExpression'
    },
    { Property: TechnicalContext, AllowedExpressions: 'SearchExpression' },
    { Property: Rationale, AllowedExpressions: 'SearchExpression' },
    { Property: Snippet, AllowedExpressions: 'SearchExpression' },
    { Property: EvidenceText, AllowedExpressions: 'SearchExpression' },
    { Property: BusinessImpact, AllowedExpressions: 'SearchExpression' },
    { Property: TechnicalImpact, AllowedExpressions: 'SearchExpression' },
    { Property: DataImpact, AllowedExpressions: 'SearchExpression' },
    { Property: UserImpact, AllowedExpressions: 'SearchExpression' },
    { Property: ReproText, AllowedExpressions: 'SearchExpression' },
    { Property: RootCause, AllowedExpressions: 'SearchExpression' },
    { Property: FixRecommendation, AllowedExpressions: 'SearchExpression' },
    {
      Property: AbapConsiderationsText,
      AllowedExpressions: 'SearchExpression'
    },
    { Property: ValidationStepsText, AllowedExpressions: 'SearchExpression' },
    { Property: RejectReason, AllowedExpressions: 'SearchExpression' }
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [
    'AffectedArea',
    'BusinessProcessContext',
    'TechnicalContext',
    'Rationale',
    'Snippet',
    'EvidenceText',
    'BusinessImpact',
    'TechnicalImpact',
    'DataImpact',
    'UserImpact',
    'ReproText',
    'RootCause',
    'FixRecommendation',
    'AbapConsiderationsText',
    'ValidationStepsText',
    'RejectReason'
  ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity Bugs {
    @Core.Computed : true
    @Common.Label : 'UUID'
    @Common.QuickInfo : '16 Byte UUID in 16 Bytes (Raw Format)'
    key RunId : UUID not null;
    key IssueId : Integer not null;
    key ProgramName : String(255) not null;
    ShortText : String(60) not null;
    IssueTitle : String(255) not null;
    Category : String(255) not null;
    Severity : String(255) not null;
    Confidence : String(255) not null;
    AffectedArea : String not null;
    BusinessProcessContext : String not null;
    TechnicalContext : String not null;
    Rationale : String not null;
    Snippet : String not null;
    EvidenceText : String not null;
    TriggerCondition : String(255) not null;
    BusinessImpact : String not null;
    TechnicalImpact : String not null;
    DataImpact : String not null;
    UserImpact : String not null;
    ReproText : String not null;
    RootCause : String not null;
    FixRecommendation : String not null;
    AbapConsiderationsText : String not null;
    ValidationStepsText : String not null;
    AuthorizationImplication : String(1024) not null;
    TransactionalRisk : String(1024) not null;
    PerformanceRisk : String(1024) not null;
    IntegrationRisk : String(1024) not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    Visibility : Boolean not null;
    @Common.Label : 'Truth Value'
    @Common.QuickInfo : 'Truth Value: True/False'
    RejectFlag : Boolean not null;
    RejectReason : String not null;
    SAP__Messages : many SAP__Message not null;
    _Run : Association to one ABAPReviewRuns on _Run.RunId = RunId;
  };
};

