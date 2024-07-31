---
sidebar_position: 3
---

# Get task time accounting list
 Get list of time accounting records for task



`Function GetTaskTimeAccountingList(Val URL, Val TaskID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | String, Number | Task ID |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/getlist.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "728";
 
 Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetTaskTimeAccountingList --url %url% --task %task% --token %token%

```

```json title="Result"
{
 "result": [
 {
 "ID": "40",
 "TASK_ID": "638",
 "USER_ID": "1",
 "COMMENT_TEXT": "",
 "SECONDS": "3600",
 "MINUTES": "60",
 "SOURCE": "2",
 "CREATED_DATE": "2024-07-12T20:36:21+00:00",
 "DATE_START": "2024-07-12T20:36:21+00:00",
 "DATE_STOP": "2024-07-12T20:36:21+00:00"
 },
 {
 "ID": "42",
 "TASK_ID": "638",
 "USER_ID": "10",
 "COMMENT_TEXT": "Time spent on work",
 "SECONDS": "7200",
 "MINUTES": "120",
 "SOURCE": "2",
 "CREATED_DATE": "2024-06-12T17:36:21+00:00",
 "DATE_START": "2024-07-12T20:36:22+00:00",
 "DATE_STOP": "2024-07-12T20:36:22+00:00"
 }
 ],
 "total": 2,
 "time": {
 "start": 1720816584.48831,
 "finish": 1720816584.5364,
 "duration": 0.0480880737304688,
 "processing": 0.0219790935516357,
 "date_start": "2024-07-12T20:36:24+00:00",
 "date_finish": "2024-07-12T20:36:24+00:00",
 "operating_reset_at": 1720817184,
 "operating": 0
 }
}
```
