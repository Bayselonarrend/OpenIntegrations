---
sidebar_position: 1
---

# Get comments list for a task
 Get user comments list for a task



`Function GetTaskCommentsList(Val URL, Val TaskID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.commentitem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/getlist.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 TaskID = "1082";
 
 Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetTaskCommentsList --url %url% --task %task% --filter %filter% --token %token%

```

```json title="Result"
{
 "result": [
 {
 "POST_MESSAGE_HTML": null,
 "ID": "1494",
 "AUTHOR_ID": "1",
 "AUTHOR_NAME": "Anton Titovets",
 "AUTHOR_EMAIL": "",
 "POST_DATE": "2024-07-06T19:52:07+00:00",
 "POST_MESSAGE": "The task has been changed, do not split up"
 },
 {
 "POST_MESSAGE_HTML": null,
 "ID": "1496",
 "AUTHOR_ID": "1",
 "AUTHOR_NAME": "Anton Titovets",
 "AUTHOR_EMAIL": "",
 "POST_DATE": "2024-07-06T19:52:08+00:00",
 "POST_MESSAGE": "The task has been changed, let's split up"
 }
 ],
 "time": {
 "start": 1720295537.77876,
 "finish": 1720295537.83513,
 "duration": 0.0563700199127197,
 "processing": 0.0240809917449951,
 "date_start": "2024-07-06T19:52:17+00:00",
 "date_finish": "2024-07-06T19:52:17+00:00",
 "operating_reset_at": 1720296137,
 "operating": 0
 }
}
```
