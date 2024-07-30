---
sidebar_position: 6
---

# Mark message as readed
 Mark current and all previous messages as readed



`Function MarkMessageAsReaded(Val URL, Val ChatID, Val MessageID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
 | MessageID | --message | String, Number | Id of last readed message |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.read](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12053)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 ChatID = "chat" + "264";
 MessageID = "5506";
 
 Result = OPI_Bitrix24.MarkMessageAsReaded(URL, ChatID, MessageID);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 UserID = 10;
 MessageID = "5508";
 
 Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 MarkMessageAsReaded --url %url% --chat %chat% --message %message% --token %token%

```

```json title="Result"
{
 "result": {
 "dialogId": 10,
 "chatId": 10,
 "lastId": 5262,
 "counter": 0
 },
 "time": {
 "start": 1720969157.61149,
 "finish": 1720969157.65659,
 "duration": 0.0451040267944336,
 "processing": 0.0171201229095459,
 "date_start": "2024-07-14T14:59:17+00:00",
 "date_finish": "2024-07-14T14:59:17+00:00",
 "operating_reset_at": 1720969757,
 "operating": 0
 }
}
```
