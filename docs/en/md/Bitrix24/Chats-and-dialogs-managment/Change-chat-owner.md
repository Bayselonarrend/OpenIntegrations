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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "872";

    UserID = 10;

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    ChatID = "874";

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 ChangeChatOwner --url "b24-ar17wx.bitrix24.by" --chat "452" --user "10" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728140853.93246,
  "finish": 1728140853.97274,
  "duration": 0.0402820110321045,
  "processing": 0.0137429237365723,
  "date_start": "2024-10-05T18:07:33+03:00",
  "date_finish": "2024-10-05T18:07:33+03:00",
  "operating_reset_at": 1728141453,
  "operating": 0
 }
}
```
