{
  "id": "WorkflowNotification",
  "packageName": "eliud_pkg_workflow",
  "packageFriendlyName": "workflow",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "message",
      "displayName": "Message",
      "fieldType": "String"
    },
    {
      "fieldName": "addressee",
      "displayName": "Addressee",
      "fieldType": "enum",
      "enumName": "WorkflowNotificationAddressee",
      "remark": "Who's to be notified after completing the  to do this task? The workflow logic will use the current member, the owner of the app, or the initiator of the workflow as the assignee of the assignment",
      "enumValues" : [ "CurrentMember", "Owner", "First", "Previous" ]
    }
  ],
  "groups": [
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional2",
        "description": "Plugin Condition",
        "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)"
    },
    {
        "group": "conditional",
        "description": "Conditional"
    }
  ]
}