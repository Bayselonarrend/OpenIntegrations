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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    ChatID = "454";

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "c03fa966006e9f06006b12e400000001000...";
    ChatID = "456";
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddUsersToChat --url "b24-ar17wx.bitrix24.by" --chat "452" --users %users% --hide %hide% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": true,
  "time": {
  "start": 1720865686.43672,
  "finish": 1720865686.52541,
  "duration": 0.0886859893798828,
  "processing": 0.0491659641265869,
  "date_start": "2024-07-13T10:14:46+00:00",
  "date_finish": "2024-07-13T10:14:46+00:00",
  "operating_reset_at": 1720866286,
  "operating": 0
  }
  }
```
