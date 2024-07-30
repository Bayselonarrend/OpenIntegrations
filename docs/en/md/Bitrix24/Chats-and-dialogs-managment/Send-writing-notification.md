---
sidebar_position: 16
---

# Send write notification
 Send Writing... status to dialog...



`Function SendWritingNotification(Val URL, Val ChatID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.writing](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23802)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 ChatID = "chat" + "264";
 
 Result = OPI_Bitrix24.SendWritingNotification(URL, ChatID);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 UserID = 10;
 
 Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 SendWritingNotification --url %url% --chat %chat% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720969162.6704,
 "finish": 1720969162.69719,
 "duration": 0.0267889499664307,
 "processing": 0.000684022903442383,
 "date_start": "2024-07-14T14:59:22+00:00",
 "date_finish": "2024-07-14T14:59:22+00:00",
 "operating_reset_at": 1720969762,
 "operating": 0
 }
}
```
