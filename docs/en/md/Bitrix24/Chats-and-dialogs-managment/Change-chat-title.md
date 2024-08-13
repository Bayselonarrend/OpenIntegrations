---
sidebar_position: 7
---

# Change chat title
 Change text of chat title



`Function ChangeChatTitle(Val URL, Val ChatID, Val Title, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Title | --title | String | New title |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.updateTitle](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12105)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    ChatID = "450";

    Title = "New chat title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    ChatID = "452";

    Title = "Another title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeChatTitle --url "b24-ar17wx.bitrix24.by" --chat "452" --title "Another title" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865687.70928,
  "finish": 1720865687.78107,
  "duration": 0.0717928409576416,
  "processing": 0.0479631423950195,
  "date_start": "2024-07-13T10:14:47+00:00",
  "date_finish": "2024-07-13T10:14:47+00:00",
  "operating_reset_at": 1720866287,
  "operating": 0
  }
  }
```
