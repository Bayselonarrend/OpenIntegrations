﻿---
sidebar_position: 20
---

# Get chat files folder
 Get information about folder for chat files



`Function GetChatFilesFolder(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.disk.folder.get](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11483)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "872";

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    ChatID = "874";

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetChatFilesFolder --url "b24-ar17wx.bitrix24.by" --chat "452" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": 12610
 },
 "time": {
  "start": 1728454911.13738,
  "finish": 1728454911.19324,
  "duration": 0.0558590888977051,
  "processing": 0.0317718982696533,
  "date_start": "2024-10-09T09:21:51+03:00",
  "date_finish": "2024-10-09T09:21:51+03:00",
  "operating_reset_at": 1728455511,
  "operating": 0
 }
}
```
