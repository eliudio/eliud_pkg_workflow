{
  "id": "Assignment",
  "packageName": "eliud_pkg_workflow",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "appId",
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this feed belongs",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "reporter",
      "remarks": "The one who initiated the assignment",
      "displayName": "Member",
      "fieldType": "Member",
      "association": true,
      "group": "Reporter"
    },
    {
      "fieldName": "assignee",
      "remarks": "The one who assignment is assiged to",
      "displayName": "Member",
      "fieldType": "Member",
      "association": true,
      "group": "Assignee"
    },
    {
      "fieldName": "task",
      "displayName": "Task",
      "fieldType": "Task"
    },
    {
      "fieldName": "workflow",
      "displayName": "Workflow",
      "fieldType": "Workflow",
      "association": true,
      "group": "member",
      "association": true,
      "group": "Workflow"
    },
    {
      "fieldName": "timestamp",
      "displayName": "Timestamp",
      "fieldType": "ServerTimestamp",
      "group": "general"
    },
    {
      "fieldName": "results",
      "displayName": "Assignment Result",
      "fieldType": "AssignmentResult",
      "arrayType": "Array"
    },
    {
      "fieldName": "triggeredBy",
      "displayName": "Triggered by",
      "fieldType": "Assignment",
      "association": true,
      "group": "Triggered"
    }
  ],
  "groups": [
    {
        "group": "Reporter",
        "description": "Reporter"
    },
    {
        "group": "Assignee",
        "description": "Assignee"
    },
    {
        "group": "Reporter",
        "description": "Reporter"
    },
    {
        "group": "Triggered",
        "description": "Triggered by"
    },
    {
        "group": "Workflow",
        "description": "Workflow"
    },
    {
        "group": "Assignee",
        "description": "Assignee"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "documentID"
  },
  "depends": ["eliud_core"]
}
