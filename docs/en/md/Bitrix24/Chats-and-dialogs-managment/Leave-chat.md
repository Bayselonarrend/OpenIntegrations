---
sidebar_position: 3
---

# Leave chat
 Removes the current user from the chat room



`Function LeaveChat(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.leave](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12101)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "872";

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    ChatID = "874";

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 LeaveChat --url "b24-ar17wx.bitrix24.by" --chat "452" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728140854.15593,
  "finish": 1728140854.22193,
  "duration": 0.0660009384155274,
  "processing": 0.0409040451049805,
  "date_start": "2024-10-05T18:07:34+03:00",
  "date_finish": "2024-10-05T18:07:34+03:00",
  "operating_reset_at": 1728141454,
  "operating": 0
 }
}
```
