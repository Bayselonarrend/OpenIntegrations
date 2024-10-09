---
sidebar_position: 14
---

# Get dialog
 Get chat data by ID



`Function GetDialog(Val URL, Val ChatID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.get](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12886)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    ChatID = "chat" + "872";

    Result = OPI_Bitrix24.GetDialog(URL, ChatID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    UserID = 10;

    Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetDialog --url "b24-ar17wx.bitrix24.by" --chat "chat + 450" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "id": 10,
  "parent_chat_id": 0,
  "parent_message_id": 0,
  "name": "",
  "description": "",
  "owner": 10,
  "extranet": false,
  "avatar": "",
  "color": "#ab7761",
  "type": "private",
  "counter": 4,
  "user_counter": 0,
  "message_count": 187,
  "unread_id": 16,
  "restrictions": {
   "avatar": true,
   "rename": true,
   "extend": true,
   "call": true,
   "mute": true,
   "leave": true,
   "leave_owner": true,
   "send": true,
   "user_list": true
  },
  "last_message_id": 17682,
  "last_id": 0,
  "marked_id": 0,
  "disk_folder_id": 0,
  "entity_type": "",
  "entity_id": "",
  "entity_data_1": "",
  "entity_data_2": "",
  "entity_data_3": "",
  "mute_list": [],
  "date_create": "2024-06-15T19:48:49+03:00",
  "message_type": "P",
  "disappearing_time": 0,
  "public": "",
  "role": "member",
  "entity_link": {
   "type": "",
   "url": ""
  },
  "permissions": {
   "manage_users_add": "member",
   "manage_users_delete": "manager",
   "manage_ui": "member",
   "manage_settings": "owner",
   "manage_messages": "member",
   "can_post": "member"
  },
  "is_new": false,
  "readed_list": [
   {
    "user_id": 10,
    "user_name": "Techno Pizza",
    "message_id": 3854,
    "date": null
   }
  ],
  "manager_list": [],
  "last_message_views": {
   "message_id": 17682,
   "first_viewers": [],
   "count_of_viewers": 0
  },
  "dialog_id": "10"
 },
 "time": {
  "start": 1728454899.5196,
  "finish": 1728454899.56299,
  "duration": 0.0433859825134277,
  "processing": 0.0178430080413818,
  "date_start": "2024-10-09T09:21:39+03:00",
  "date_finish": "2024-10-09T09:21:39+03:00",
  "operating_reset_at": 1728455499,
  "operating": 0
 }
}
```
