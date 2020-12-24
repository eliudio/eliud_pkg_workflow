{
  "id": "Assignment",
  "packageName": "eliud_pkg_workflow",
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
      "group": "member"
    },
    {
      "fieldName": "assignee",
      "remarks": "The one who assignment is assiged to",
      "displayName": "Member",
      "fieldType": "Member",
      "association": true,
      "group": "member"
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
      "fieldName": "triggeringAssignment",
      "remarks": "The assignment that triggered this assignment",
      "displayName": "Triggering Assignment",
      "fieldType": "Assignment",
      "association": true,
      "group": "Assignment"
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
        "group": "Workflow",
        "description": "Workflow"
    },
    {
        "group": "Assignment",
        "description": "Assignment"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "documentID"
  },
  "depends": ["eliud_core"]
}
