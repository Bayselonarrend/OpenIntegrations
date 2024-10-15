---
sidebar_position: 7
---

# Mark message as unreaded
 Mark current and all messages after as unreaded



`Function MarkMessageAsUnreaded(Val URL, Val ChatID, Val MessageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | MessageID | --message | String, Number | ID of last unreaded message |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.unread](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12055)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID    = "chat" + "1006";
    MessageID = "18126";

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, ChatID, MessageID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "21750a67006e9f06006b12e400000001000...";
    UserID    = 10;
    MessageID = "18128";

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, UserID, MessageID, Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454899.19949,
  "finish": 1728454899.27714,
  "duration": 0.0776529312133789,
  "processing": 0.0525820255279541,
  "date_start": "2024-10-09T09:21:39+03:00",
  "date_finish": "2024-10-09T09:21:39+03:00",
  "operating_reset_at": 1728455499,
  "operating": 0
 }
}
```
