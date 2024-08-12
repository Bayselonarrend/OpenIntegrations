---
sidebar_position: 2
---

# Get chats users
 Gets the list of chat users by ID



`Function GetChatUsers(Val URL, Val ChatID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.user.list](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12095)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 ChatID = "450";
 
 Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 ChatID = "452";
 
 Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetChatUsers --url %url% --chat %chat% --token %token%

```

```json title="Result"
{
 "result": [
 1,
 10
 ],
 "time": {
 "start": 1720816598.61771,
 "finish": 1720816598.64882,
 "duration": 0.0311079025268555,
 "processing": 0.00316882133483887,
 "date_start": "2024-07-12T20:36:38+00:00",
 "date_finish": "2024-07-12T20:36:38+00:00",
 "operating_reset_at": 1720817198,
 "operating": 0
 }
}
```
