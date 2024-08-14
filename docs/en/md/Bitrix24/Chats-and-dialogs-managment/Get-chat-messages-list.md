---
sidebar_position: 13
---

# Get chat messages list
 Gets a list of 20 chat or dialog messages, depending on the FirstID and LastID specified



`Function GetChatMessagesList(Val URL, Val ChatID, Val LastID = "", Val FirstID = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | LastID | --last | String, Number | Id of last message |
  | FirstID | --first | String, Number | ID of first message |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.messages.get](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11479)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "chat4";

    Result = OPI_Bitrix24.GetChatMessagesList(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "7a63bc66006e9f06006b12e400000001000...";
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMessagesList(URL, UserID, , 0, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetChatMessagesList --url "b24-ar17wx.bitrix24.by" --chat "chat4" --last %last% --first %first% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "chat_id": 10,
  "messages": [
  {
  "id": 3854,
  "chat_id": 10,
  "author_id": 10,
  "date": "2024-07-13T14:54:43+00:00",
  "text": "Write it!",
  "unread": false,
  "uuid": "700d361d-8324-47fb-b989-647949c1c899",
  "replaces": [],
  "params": [],
  "disappearing_date": null
  },
  {
  "id": 4286,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T16:06:51+00:00",
  "text": "Message text",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": [],
  "disappearing_date": null
  },
  {
  "id": 4366,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T16:40:58+00:00",
  "text": "Message text",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": [],
  "disappearing_date": null
  },
  {
  "id": 4406,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T19:57:33+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4446,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T20:21:27+00:00",
  "text": "Message text",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": [],
  "disappearing_date": null
  },
  {
  "id": 4486,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T20:22:30+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4526,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-13T20:41:21+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4668,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:10:33+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4708,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:22:56+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4748,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:26:01+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4788,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:28:01+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4828,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:28:36+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4868,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:30:18+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4908,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:52:24+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4948,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:53:31+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 4990,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:57:06+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 5060,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T08:59:43+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 5140,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T09:29:40+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 5182,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T09:35:56+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  },
  {
  "id": 5262,
  "chat_id": 10,
  "author_id": 1,
  "date": "2024-07-14T11:27:54+00:00",
  "text": "This message was deleted",
  "unread": false,
  "uuid": null,
  "replaces": [],
  "params": {
  "IS_DELETED": "Y"
  },
  "disappearing_date": null
  }
  ],
  "users": [
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
  "last_activity_date": "2024-07-13T18:36:23+00:00",
  "mobile_last_date": false,
  "absent": false,
  "departments": [
  1
  ],
  "phones": false,
  "desktop_last_date": false
  },
  {
  "id": 1,
  "active": true,
  "name": "Anton Titovets",
  "first_name": "Anton",
  "last_name": "Titovets",
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
  "last_activity_date": "2024-07-14T09:00:58+00:00",
  "mobile_last_date": false,
  "absent": false,
  "departments": [
  1
  ],
  "phones": false,
  "desktop_last_date": false
  }
  ],
  "files": []
  },
  "time": {
  "start": 1720969156.38474,
  "finish": 1720969156.42064,
  "duration": 0.0358970165252686,
  "processing": 0.0108029842376709,
  "date_start": "2024-07-14T14:59:16+00:00",
  "date_finish": "2024-07-14T14:59:16+00:00",
  "operating_reset_at": 1720969756,
  "operating": 0
  }
  }
```
