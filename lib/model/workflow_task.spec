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
      "fieldName": "task",
      "displayName": "Task",
      "fieldType": "Task",
      "group": "Task"
    }
  ],
  "groups": [
    {
        "group": "Task",
        "description": "Task"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "documentID"
  }
}
