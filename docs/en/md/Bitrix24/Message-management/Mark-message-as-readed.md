---
sidebar_position: 6
---

# Mark message as readed
 Mark current and all previous messages as readed



`Function MarkMessageAsReaded(Val URL, Val ChatID, Val MessageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | MessageID | --message | String, Number | Id of last readed message |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.read](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12053)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID    = "chat" + "872";
    MessageID = "15660";

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, ChatID, MessageID);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    UserID    = 10;
    MessageID = "15662";

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 MarkMessageAsReaded --url "b24-ar17wx.bitrix24.by" --chat "chat + 450" --message "8684" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "dialogId": 10,
  "chatId": 10,
  "lastId": 17682,
  "counter": 0
 },
 "time": {
  "start": 1728454899.00309,
  "finish": 1728454899.04547,
  "duration": 0.0423820018768311,
  "processing": 0.0175080299377441,
  "date_start": "2024-10-09T09:21:39+03:00",
  "date_finish": "2024-10-09T09:21:39+03:00",
  "operating_reset_at": 1728455499,
  "operating": 0
 }
}
```
