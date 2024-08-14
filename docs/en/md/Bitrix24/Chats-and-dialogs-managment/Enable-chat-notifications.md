---
sidebar_position: 12
---

# Enable chat notifications
 Enable chat notifications



`Function EnableChatNotifications(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.mute](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11473)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2pp...";
    ChatID = "450";

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    ChatID = "452";

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 EnableChatNotifications --url "b24-ar17wx.bitrix24.by" --chat "452" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865695.99933,
  "finish": 1720865696.04205,
  "duration": 0.0427119731903076,
  "processing": 0.0170090198516846,
  "date_start": "2024-07-13T10:14:55+00:00",
  "date_finish": "2024-07-13T10:14:56+00:00",
  "operating_reset_at": 1720866296,
  "operating": 0
  }
  }
```
