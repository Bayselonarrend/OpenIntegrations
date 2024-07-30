---
sidebar_position: 5
---

# Update task time accounting
 Update time accounting record data



`Function UpdateTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Time, Val Text = "", Val SetupDate = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | String, Number | Task ID |
 | RecordID | --record | String, Number | Time record ID |
 | Time | --amount | String, Number | Time spent in seconds |
 | Text | --text | String | Comment text |
 | SetupDate | --date | String | Date the record was set |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/update.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "728";
 RecordID = "76";
 
 Text = "The text I forgot last time";
 Time = 4800;
 
 Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 RecordID = "78";
 
 Text = "New time record";
 Time = 4800;
 SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);
 
 Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL
, TaskID
, RecordID
, Time
, Text
, SetupDate
, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 UpdateTaskTimeAccounting --url %url% --task %task% --record %record% --amount %amount% --text %text% --date %date% --token %token%

```

```json title="Result"
{
 "result": null,
 "time": {
 "start": 1720816585.70407,
 "finish": 1720816585.77088,
 "duration": 0.0668020248413086,
 "processing": 0.0276288986206055,
 "date_start": "2024-07-12T20:36:25+00:00",
 "date_finish": "2024-07-12T20:36:25+00:00",
 "operating_reset_at": 1720817185,
 "operating": 0
 }
}
```
