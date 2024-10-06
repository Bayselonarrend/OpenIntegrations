﻿---
sidebar_position: 2
---

# Get chats users
 Gets the list of chat users by ID



`Function GetChatUsers(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.user.list](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12095)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "872";

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    ChatID = "874";

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetChatUsers --url "b24-ar17wx.bitrix24.by" --chat "452" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  1,
  10
 ],
 "time": {
  "start": 1728140809.44685,
  "finish": 1728140809.47424,
  "duration": 0.0273900032043457,
  "processing": 0.00313997268676758,
  "date_start": "2024-10-05T18:06:49+03:00",
  "date_finish": "2024-10-05T18:06:49+03:00",
  "operating_reset_at": 1728141409,
  "operating": 0
 }
}
```
