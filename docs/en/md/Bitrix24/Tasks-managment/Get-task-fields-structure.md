---
sidebar_position: 26
---

# Get task fields structure
 Gets a structure with a description of the fields for creating a task



`Function GetTaskFieldsStructure(Val URL, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.getFields](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_getFields.php)
:::
<br/>


```bsl title="Code example"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "c3abf666006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskFieldsStructure --url "b24-ar17wx.bitrix24.by" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "fields": {
  "ID": {
  "title": "ID",
  "type": "integer",
  "primary": true
  },
  "PARENT_ID": {
  "title": "ID of base task",
  "type": "integer",
  "default": 0
  },
  "TITLE": {
  "title": "Name",
  "type": "string",
  "required": true
  },
  "DESCRIPTION": {
  "title": "Description",
  "type": "string"
  },
  "MARK": {
  "title": "Mark",
  "type": "enum",
  "values": {
  "N": "Negative",
  "P": "Positive"
  },
  "default": null
  },
  "PRIORITY": {
  "title": "Priority",
  "type": "enum",
  "values": {
  "2": "High",
  "1": "Normal",
  "0": "Low"
  },
  "default": 1
  },
  "STATUS": {
  "title": "Status",
  "type": "enum",
  "values": {
  "2": "Waiting of completing",
  "3": "In work",
  "4": "On controll",
  "5": "Complete",
  "6": "Deferred"
  },
  "default": 2
  },
  "MULTITASK": {
  "title": "Multiple task",
  "type": "enum",
  "values": {
  "Y": "Yes",
  "N": "No"
  },
  "default": "N"
  },
  "NOT_VIEWED": {
  "title": null,
  "type": "enum",
  "values": {
  "Y": "Yes",
  "N": "No"
  },
  "default": "N"
  },
  "REPLICATE": {
  "title": "Repeatable task",
  "type": "enum",
  "values": {
  "Y": "Yes",
  "N": "No"
  },
  "default": "N"
  },
  "GROUP_ID": {
  "title": "Project",
  "type": "integer",
  "default": 0
  },
  "STAGE_ID": {
  "title": "Stage",
  "type": "integer",
  "default": 0
  },
  "CREATED_BY": {
  "title": "Producer",
  "type": "integer",
  "required": true
  },
  "CREATED_DATE": {
  "title": null,
  "type": "datetime"
  },
  "RESPONSIBLE_ID": {
  "title": "Responsible",
  "type": "integer",
  "required": true
  },
  "ACCOMPLICES": {
  "title": null,
  "type": "array"
  },
  "AUDITORS": {
  "title": null,
  "type": "array"
  },
  "CHANGED_BY": {
  "title": "Changer",
  "type": "integer"
  },
  "CHANGED_DATE": {
  "title": "Date change",
  "type": "datetime"
  },
  "STATUS_CHANGED_BY": {
  "title": "Changer status",
  "type": "integer"
  },
  "STATUS_CHANGED_DATE": {
  "title": "Date change of status",
  "type": "datetime"
  },
  "CLOSED_BY": {
  "title": "Close task",
  "type": "integer",
  "default": null
  },
  "CLOSED_DATE": {
  "title": "Date of closing",
  "type": "datetime",
  "default": null
  },
  "ACTIVITY_DATE": {
  "title": null,
  "type": "datetime",
  "default": null
  },
  "DATE_START": {
  "title": "Date of start",
  "type": "datetime",
  "default": null
  },
  "DEADLINE": {
  "title": "Last deadline",
...
```
