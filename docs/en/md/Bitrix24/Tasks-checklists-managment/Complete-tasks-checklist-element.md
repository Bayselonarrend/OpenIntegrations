---
sidebar_position: 6
---

# Complete tasks checklist element
 Mark an element as completed



`Function CompleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | ElementID | --element | Number, String | Element ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.complete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/complete.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "720";
 ElementID = "164";
 
 Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);
 
 
 TaskID = "722";
 ElementID = "168";
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 CompleteTasksChecklistElement --url %url% --task %task% --element %element% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720816509.8981,
 "finish": 1720816509.94922,
 "duration": 0.0511200428009033,
 "processing": 0.0246191024780273,
 "date_start": "2024-07-12T20:35:09+00:00",
 "date_finish": "2024-07-12T20:35:09+00:00",
 "operating_reset_at": 1720817109,
 "operating": 0
 }
}
```
