---
sidebar_position: 16
---

# Send write notification
 Send Writing... status to dialog...



`Function SendWritingNotification(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.writing](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23802)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "chat" + "872";

    Result = OPI_Bitrix24.SendWritingNotification(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = 10;

    Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 SendWritingNotification --url "b24-ar17wx.bitrix24.by" --chat "chat + 450" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728329215.9156,
  "finish": 1728329215.94298,
  "duration": 0.0273830890655518,
  "processing": 0.00097203254699707,
  "date_start": "2024-10-07T22:26:55+03:00",
  "date_finish": "2024-10-07T22:26:55+03:00",
  "operating_reset_at": 1728329815,
  "operating": 0
 }
}
```
