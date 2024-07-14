---
sidebar_position: 7
---

# Renew tasks checklist element
 Unmark an element as completed



`Function RenewTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | ElementID | --element | Number, String | Element ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.renew](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/renew.php)
:::
<br/>


```bsl title="Code example"
 URL = FunctionParameters["Bitrix24_URL"];
 TaskID = FunctionParameters["Bitrix24_HookTaskID"];
 ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];
 
 Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);
 
 
 TaskID = FunctionParameters["Bitrix24_TaskID"];
 ElementID = FunctionParameters["Bitrix24_CheckElementID"];
 
 URL = FunctionParameters["Bitrix24_Domain"];
 Token = FunctionParameters["Bitrix24_Token"];
 
 Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 RenewTasksChecklistElement --url %url% --task %task% --element %element% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720816511.09347,
 "finish": 1720816511.14508,
 "duration": 0.051609992980957,
 "processing": 0.0250108242034912,
 "date_start": "2024-07-12T20:35:11+00:00",
 "date_finish": "2024-07-12T20:35:11+00:00",
 "operating_reset_at": 1720817111,
 "operating": 0
 }
}
```
