---
sidebar_position: 1
---

# Add task time accounting
 Adds information about the user's time spent to the task



`Function AddTaskTimeAccounting(Val URL, Val TaskID, Val Time, Val UserID = "", Val Text = "", Val SetupDate = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | String, Number | ID of task for time accounting |
 | Time | --amount | String, Number | Time spent in seconds |
 | UserID | --user | String, Number | ID of user for time accounting |
 | Text | --text | String | Comment text |
 | SetupDate | --date | String | Date the record was set |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/add.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 TaskID = "1088";
 
 Time = 3600;
 
 Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Text = "Time spent on work";
 UserID = 10;
 Time = 7200;
 SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);
 
 Result = OPI_Bitrix24.AddTaskTimeAccounting(URL
, TaskID
, Time
, UserID
, Text
, SetupDate
, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 AddTaskTimeAccounting --url %url% --task %task% --amount %amount% --user %user% --text %text% --date %date% --token %token%

```

```json title="Result"
{
 "result": 42,
 "time": {
 "start": 1720816582.16849,
 "finish": 1720816582.22964,
 "duration": 0.0611569881439209,
 "processing": 0.0315871238708496,
 "date_start": "2024-07-12T20:36:22+00:00",
 "date_finish": "2024-07-12T20:36:22+00:00",
 "operating_reset_at": 1720817182,
 "operating": 0
 }
}
```
