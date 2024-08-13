---
sidebar_position: 11
---

# Disable chat notifications
 Disable chat notifications



`Function DisableChatNotifications(Val URL, Val ChatID, Val Token = "") Export`

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
  URL    = FunctionParameters["Bitrix24_URL"];
  ChatID = FunctionParameters["Bitrix24_HookChatID"];
  
  Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "DisableChatNotifications (wh)", "Bitrix24");
  
  URL    = FunctionParameters["Bitrix24_Domain"];
  Token  = FunctionParameters["Bitrix24_Token"];
  ChatID = FunctionParameters["Bitrix24_ChatID"];
  
  Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DisableChatNotifications --url "b24-ar17wx.bitrix24.by" --chat "452" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865694.86568,
  "finish": 1720865694.9092,
  "duration": 0.0435128211975098,
  "processing": 0.0169928073883057,
  "date_start": "2024-07-13T10:14:54+00:00",
  "date_finish": "2024-07-13T10:14:54+00:00",
  "operating_reset_at": 1720866294,
  "operating": 0
  }
  }
```
