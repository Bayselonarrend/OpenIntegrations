﻿---
sidebar_position: 8
---

# Change chat color
 Chat chat color for mobile app



`Function ChangeChatColor(Val URL, Val ChatID, Val Color, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Color | --color | String | New chat color |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.updateTitle](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12105)

 Available colors: RED, GREEN, MINT, LIGHT_BLUE, DARK_BLUE, PURPLE, AQUA, PINK, LIME, BROWN, AZURE, KHAKI, SAND, MARENGO, GRAY, GRAPHITE
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "872";

    Color = "AZURE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Color = "PURPLE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeChatColor --url "b24-ar17wx.bitrix24.by" --chat "452" --color "PURPLE" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454888.85994,
  "finish": 1728454888.95268,
  "duration": 0.0927419662475586,
  "processing": 0.064525842666626,
  "date_start": "2024-10-09T09:21:28+03:00",
  "date_finish": "2024-10-09T09:21:28+03:00",
  "operating_reset_at": 1728455488,
  "operating": 0
 }
}
```
