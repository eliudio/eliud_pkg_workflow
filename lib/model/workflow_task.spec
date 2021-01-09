{
  "id": "WorkflowTask",
  "packageName": "eliud_pkg_workflow",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": false,
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
      "fieldName": "seqNumber",
      "displayName": "Sequence number",
      "fieldType": "int"
    },
    {
      "fieldName": "task",
      "displayName": "Task",
      "fieldType": "Task",
      "group": "Task"
    },
    {
      "fieldName": "confirmMessage",
      "remark": "Message to be sent after this task is completed successfully",
      "displayName": "Confirm Message",
      "fieldType": "WorkflowNotification",
      "group": "WorkflowNotification"
    },
    {
      "fieldName": "rejectMessage",
      "remark": "Message to be sent after this task is completed unsuccessfully",
      "displayName": "Refect Message",
      "fieldType": "WorkflowNotification",
      "group": "WorkflowNotification"
    },
    {
      "fieldName": "responsible",
      "displayName": "Responsible",
      "fieldType": "enum",
      "enumName": "WorkflowTaskResponsible",
      "remark": "Who's responsible to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment",
      "enumValues" : [ "CurrentMember", "Owner", "First", "Previous" ]
    }
  ],
  "groups": [
    {
        "group": "Task",
        "description": "Task"
    },
    {
        "group": "WorkflowNotification",
        "description": "WorkflowNotification"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "documentID"
  }
}
