---
sidebar_position: 1
---

# Add tasks checklist element
 Adds new element of tasks checklist



`Function AddTasksChecklistElement(Val URL, Val TaskID, Val Text, Val Completed = False, Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Text | --text | String | Text (title) of checklist element |
 | Completed | --complete | Boolean | Mark as completed |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/add.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "720";
 
 Text = "Checklist element";
 
 Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);
 
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 TaskID = "722";
 
 Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text,, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 AddTasksChecklistElement --url %url% --task %task% --text %text% --complete %complete% --token %token%

```

```json title="Result"
{
 "result": 96,
 "time": {
 "start": 1720816505.3041,
 "finish": 1720816505.37014,
 "duration": 0.0660440921783447,
 "processing": 0.0380921363830566,
 "date_start": "2024-07-12T20:35:05+00:00",
 "date_finish": "2024-07-12T20:35:05+00:00",
 "operating_reset_at": 1720817105,
 "operating": 0
 }
}
```
