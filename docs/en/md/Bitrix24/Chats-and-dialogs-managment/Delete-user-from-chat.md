---
sidebar_position: 5
---

# Delete user from chat
 Deletes user from chat



`Function DeleteUserFromChat(Val URL, Val ChatID, Val UserID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID |
 | UserID | --user | String, Number | User ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.user.delete](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12099)
:::
<br/>


```bsl title="Code example"
 URL = FunctionParameters["Bitrix24_URL"];
 ChatID = FunctionParameters["Bitrix24_HookChatID"];
 
 UserID = 10;
 
 Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID);
 
 
 URL = FunctionParameters["Bitrix24_Domain"];
 Token = FunctionParameters["Bitrix24_Token"];
 ChatID = FunctionParameters["Bitrix24_ChatID"];
 
 Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeleteUserFromChat --url %url% --chat %chat% --user %user% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720865685.25089,
 "finish": 1720865685.32425,
 "duration": 0.0733590126037598,
 "processing": 0.0480890274047852,
 "date_start": "2024-07-13T10:14:45+00:00",
 "date_finish": "2024-07-13T10:14:45+00:00",
 "operating_reset_at": 1720866285,
 "operating": 0
 }
}
```
