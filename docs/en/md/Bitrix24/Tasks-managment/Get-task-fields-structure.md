---
sidebar_position: 1
---

# Get task fields structure
 Gets a structure with a description of the fields for creating a task


*Function GetTaskFieldsStructure(Val URL, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);
	
```

```sh title="CLI command example"
 
oint bitrix24 GetTaskFieldsStructure --url "b24-ar17wx.bitrix24.by" --token "b9df7366006e9f06006b12e400000001000..."

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
 "title": "ID базоinой of topic",
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
 "title": "Оценtoа",
 "type": "enum",
 "values": {
 "N": "Оthreeцательtoя",
 "P": "Toложandтельtoя"
 },
 "default": null
 },
 "PRIORITY": {
 "title": "Прandорandтет",
 "type": "enum",
 "values": {
 "2": "Inыwithtoandй",
 "1": "Midнandй",
 "0": "Nfromtoandй"
 },
 "default": 1
 },
 "STATUS": {
 "title": "Status",
 "type": "enum",
 "values": {
 "2": "Ждет of completing",
 "3": "Inыtoлняетwithя",
 "4": "Ожandдает toонтроля",
 "5": "Заinершеto",
 "6": "Отложеto"
 },
 "default": 2
 },
 "MULTITASK": {
 "title": "Мbutжеwithтinенtoя task",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "NOT_VIEWED": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "REPLICATE": {
 "title": "Toinторяемая task",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "GROUP_ID": {
 "title": "Проеtoт",
 "type": "integer",
 "default": 0
 },
 "STAGE_ID": {
 "title": "Стадandя",
 "type": "integer",
 "default": 0
 },
 "CREATED_BY": {
 "title": "Postаbutinщandto",
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
 "title": "Inменandл",
 "type": "integer"
 },
 "CHANGED_DATE": {
 "title": "Date change",
 "type": "datetime"
 },
 "STATUS_CHANGED_BY": {
 "title": "Inменandл status",
 "type": "integer"
 },
 "STATUS_CHANGED_DATE": {
 "title": "Date change of status",
 "type": "datetime"
 },
 "CLOSED_BY": {
 "title": "Заtoрыл задачу",
 "type": "integer",
 "default": null
 },
 "CLOSED_DATE": {
 "title": "Date заtoрытandя",
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
 "title": "Kрайнandй deadline",
 "type": "datetime",
 "default": null
 },
 "START_DATE_PLAN": {
 "title": "Плаbutinое toчало",
 "type": "datetime",
 "default": null
 },
 "END_DATE_PLAN": {
 "title": "Плаbutinое заinершенandе",
 "type": "datetime",
 "default": null
 },
 "GUID": {
 "title": "GUID",
 "type": "string",
 "default": null
 },
 "XML_ID": {
 "title": "XML_ID",
 "type": "string",
 "default": null
 },
 "COMMENTS_COUNT": {
 "title": "Kол-inо toомментарandеin",
 "type": "integer",
 "default": 0
 },
 "SERVICE_COMMENTS_COUNT": {
 "title": null,
 "type": "integer",
 "default": 0
 },
 "NEW_COMMENTS_COUNT": {
 "title": null,
 "type": "integer",
 "default": 0
 },
 "ALLOW_CHANGE_DEADLINE": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "ALLOW_TIME_TRACKING": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "TASK_CONTROL": {
 "title": "Прandнять работу",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "ADD_IN_REPORT": {
 "title": "Add in отчет",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "FORKED_BY_TEMPLATE_ID": {
 "title": "Создаbut from шаблоto",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "TIME_ESTIMATE": {
 "title": "Затрачеbutе inремя",
 "type": "integer"
 },
 "TIME_SPENT_IN_LOGS": {
 "title": "Затрачеbutе inремя from andwithторandand changedandй",
 "type": "integer"
 },
 "MATCH_WORK_TIME": {
 "title": "Skip inыходные днand",
 "type": "integer"
 },
 "FORUM_TOPIC_ID": {
 "title": "FORUM_TOPIC_ID",
 "type": "integer"
 },
 "FORUM_ID": {
 "title": "FORUM_ID",
 "type": "integer"
 },
 "SITE_ID": {
 "title": "SITE_ID",
 "type": "string"
 },
 "SUBORDINATE": {
 "title": "Задача toдчandnotнbutго",
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": null
 },
 "FAVORITE": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": null
 },
 "EXCHANGE_MODIFIED": {
 "title": "EXCHANGE_MODIFIED",
 "type": "datetime",
 "default": null
 },
 "EXCHANGE_ID": {
 "title": "EXCHANGE_ID",
 "type": "integer",
 "default": null
 },
 "OUTLOOK_VERSION": {
 "title": "OUTLOOK_VERSION",
 "type": "integer",
 "default": null
 },
 "VIEWED_DATE": {
 "title": "Date of last проwithмотра",
 "type": "datetime"
 },
 "SORTING": {
 "title": "Andндеtowith of sorting",
 "type": "double"
 },
 "DURATION_PLAN": {
 "title": "Затрачеbut (план)",
 "type": "integer"
 },
 "DURATION_FACT": {
 "title": "Затрачеbut (фаtoтandчеwithtoand)",
 "type": "integer"
 },
 "CHECKLIST": {
 "title": null,
 "type": "array"
 },
 "DURATION_TYPE": {
 "title": "DURATION_TYPE",
 "type": "enum",
 "values": [
 "secs",
 "mins",
 "hours",
 "days",
 "weeks",
 "monts",
 "years"
 ],
 "default": "days"
 },
 "IS_MUTED": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "IS_PINNED": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "IS_PINNED_IN_GROUP": {
 "title": null,
 "type": "enum",
 "values": {
 "Y": "Да",
 "N": "No"
 },
 "default": "N"
 },
 "FLOW_ID": {
 "title": null,
 "type": "integer",
 "default": 0
 },
 "UF_CRM_TASK": {
 "title": "Items CRM",
 "type": "crm"
 },
 "UF_TASK_WEBDAV_FILES": {
 "title": "Load files",
 "type": "disk_file"
 },
 "UF_MAIL_MESSAGE": {
 "title": null,
 "type": "mail_message"
 }
 }
 },
 "time": {
 "start": 1718473322.5296,
 "finish": 1718473322.56673,
 "duration": 0.0371248722076416,
 "processing": 0.00164389610290527,
 "date_start": "2024-06-15T17:42:02+00:00",
 "date_finish": "2024-06-15T17:42:02+00:00",
 "operating_reset_at": 1718473922,
 "operating": 0
 }
}

```
