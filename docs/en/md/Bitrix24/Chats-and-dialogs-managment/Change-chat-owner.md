---
sidebar_position: 10
---

# Change chat owner
 Change chat owner



`Function ChangeChatOwner(Val URL, Val ChatID, Val UserID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | UserID | --user | String, Number | User ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.setOwner](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12111)
:::
<br/>


```bsl title="Code example"
  URL    = FunctionParameters["Bitrix24_URL"];
  ChatID = FunctionParameters["Bitrix24_HookChatID"];
  
  UserID = 10;
  
  Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatOwner (wh)", "Bitrix24");
  
  URL    = FunctionParameters["Bitrix24_Domain"];
  Token  = FunctionParameters["Bitrix24_Token"];
  ChatID = FunctionParameters["Bitrix24_ChatID"];
  
  Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeChatOwner --url "b24-ar17wx.bitrix24.by" --chat "452" --user "10" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865697.10595,
  "finish": 1720865697.13924,
  "duration": 0.0332820415496826,
  "processing": 0.0104668140411377,
  "date_start": "2024-07-13T10:14:57+00:00",
  "date_finish": "2024-07-13T10:14:57+00:00",
  "operating_reset_at": 1720866297,
  "operating": 0
  }
  }
```
