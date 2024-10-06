---
sidebar_position: 15
---

# Get chat members list
 Get chat members list



`Function GetChatMembersList(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.users.list](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23800)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "chat" + "872";

    Result = OPI_Bitrix24.GetChatMembersList(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetChatMembersList --url "b24-ar17wx.bitrix24.by" --chat "chat + 450" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "id": 10,
   "active": true,
   "name": "Techno Pizza",
   "first_name": "Techno",
   "last_name": "Pizza",
   "work_position": null,
   "color": "#ab7761",
   "avatar": "",
   "gender": "M",
   "birthday": "",
   "extranet": false,
   "network": false,
   "bot": false,
   "connector": false,
   "external_auth_id": "socservices",
   "status": "online",
   "idle": false,
   "last_activity_date": "2024-07-13T21:36:23+03:00",
   "mobile_last_date": false,
   "absent": false,
   "departments": [
    1,
    264
   ],
   "phones": false,
   "bot_data": null
  },
  {
   "id": 1,
   "active": true,
   "name": "Антон Титовец",
   "first_name": "Антон",
   "last_name": "Титовец",
   "work_position": null,
   "color": "#df532d",
   "avatar": "https://cdn-ru.bitrix24.by/b28528874/resize_cache/30/ff58db95aecdfa09ae61b51b5fd8f63f/main/d7e/d7e99cf556e4ab676463dae2c00ddfbb/a7e0af6899300e3c684caeca5c334d81.jpg",
   "gender": "M",
   "birthday": "",
   "extranet": false,
   "network": false,
   "bot": false,
   "connector": false,
   "external_auth_id": "socservices",
   "status": "online",
   "idle": false,
   "last_activity_date": "2024-09-17T21:21:49+03:00",
   "mobile_last_date": false,
   "absent": false,
   "departments": [
    1,
    264
   ],
   "phones": false,
   "bot_data": null
  }
 ],
 "total": 2,
 "time": {
  "start": 1728140840.20876,
  "finish": 1728140840.24297,
  "duration": 0.0342061519622803,
  "processing": 0.00686001777648926,
  "date_start": "2024-10-05T18:07:20+03:00",
  "date_finish": "2024-10-05T18:07:20+03:00",
  "operating_reset_at": 1728141440,
  "operating": 0
 }
}
```
