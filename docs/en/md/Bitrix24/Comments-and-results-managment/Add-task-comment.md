---
sidebar_position: 3
---

# Add comment to task
 Create new comment to the task


<br/>


`Function AddTaskComment(Val URL, Val TaskID, Val Text, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Text | --text | String | Comment text |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "504";
 
 Text = "Task impossible, let's split up";
 
 Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "56898d66006e9f06006b12e400000001000...";
 
 Text = "Task uninpossible, don't split up";
 
 Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 AddTaskComment --url "b24-ar17wx.bitrix24.by" --task "504" --text %text% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 1376,
 "time": {
 "start": 1720186702.77405,
 "finish": 1720186703.52768,
 "duration": 0.753632068634033,
 "processing": 0.724568128585816,
 "date_start": "2024-07-05T13:38:22+00:00",
 "date_finish": "2024-07-05T13:38:23+00:00",
 "operating_reset_at": 1720187302,
 "operating": 0.724542856216431
 }
}
```
