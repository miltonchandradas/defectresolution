# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start with your domain model, in a CDS file in `db/`

## Learn More

Learn more at <https://cap.cloud.sap>.

## Trigger Defect Orchestration Action

Use this endpoint to trigger on-demand orchestration for one or more defect IDs.

POST URL:

```text
/service/defects/triggerDefectOrchestration
```

Example request body:

```json
{
	"defectIds": "8000197596,8000193368",
	"processType": "S1DM"
}
```

Example with local default host:

```text
POST http://localhost:4004/service/defects/triggerDefectOrchestration
Content-Type: application/json
Authorization: Bearer <ACCESS_TOKEN>
```
