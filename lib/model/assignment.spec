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
    "generateEmbeddedComponent": true,
    "isDocumentCollection": true
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
      "displayName": "Reporter",
      "fieldType": "Member",
      "association": true,
      "group": "Reporter"
    },
    {
      "fieldName": "assigneeId",
      "remarks": "The one who assignment is assiged to. This is a a string, not a Member to be able to assign to a Member to which the currently logged in Member does not have access to",
      "displayName": "Assignee",
      "fieldType": "String",
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
      "fieldName": "workflowTaskSeqNumber",
      "remark": "this corresponds to the WorkflowModel.workflowTask[i].seqNumber",
      "displayName": "Workflow Sequence Id",
      "fieldType": "int"
    },
    {
      "fieldName": "timestamp",
      "displayName": "Timestamp",
      "fieldType": "ServerTimestamp",
      "group": "general"
    },
    {
      "fieldName": "status",
      "fieldType": "enum",
      "enumName": "AssignmentStatus",
      "enumValues" : [ "Success", "Declined", "Open" ]
    },
    {
      "fieldName": "resultsCurrent",
      "displayName": "Result current Assignment",
      "remark": "The results of the current assignment",
      "fieldType": "AssignmentResult",
      "arrayType": "Array"
    },
    {
      "fieldName": "resultsPrevious",
      "displayName": "Result previous Assignment",
      "remark": "The results of the assignment that preceded this assignment. So this is the same as the resultsCurrent of the preceeding task to which the current member might not have access to (no read access rights)",
      "fieldType": "AssignmentResult",
      "arrayType": "Array"
    },
    {
      "fieldName": "triggeredById",
      "displayName": "Triggered by",
      "fieldType": "String",
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
  "depends": ["eliud_core"],
  "extraImports": {
    "alternative_list_widgets" : "import 'package:eliud_pkg_workflow/extensions/widgets/my_assignment_list_item.dart';"
  },
  "alternativeListWidgets": [
    {
        "listItemWidget": "MyAssignmentListItem"
    }
  ]
}
