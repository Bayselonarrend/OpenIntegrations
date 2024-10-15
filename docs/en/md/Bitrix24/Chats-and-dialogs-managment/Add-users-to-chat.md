---
sidebar_position: 5
---

# Add users to chat
 Adds users to the chat by ID array



`Function AddUsersToChat(Val URL, Val ChatID, Val UserIDs, Val HideHistory = False, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID |
  | UserIDs | --users | Array of string, number | New members IDs |
  | HideHistory | --hide | Boolean | Hide old messages from new members |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.user.add](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12097)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "1006";

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "21750a67006e9f06006b12e400000001000...";
    ChatID = "1008";
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);
```
 



```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454873.26338,
  "finish": 1728454873.34975,
  "duration": 0.0863678455352783,
  "processing": 0.0585901737213135,
  "date_start": "2024-10-09T09:21:13+03:00",
  "date_finish": "2024-10-09T09:21:13+03:00",
  "operating_reset_at": 1728455473,
  "operating": 0
 }
}
```
