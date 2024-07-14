---
sidebar_position: 13
---

# Get dialog
 Get chat data by ID



`Function GetDialog(Val URL, Val ChatID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.get](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12886)
:::
<br/>


```bsl title="Code example"
 URL = FunctionParameters["Bitrix24_URL"];
 ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];
 
 Result = OPI_Bitrix24.GetDialog(URL, ChatID);
 
 
 URL = FunctionParameters["Bitrix24_Domain"];
 Token = FunctionParameters["Bitrix24_Token"];
 UserID = 10;
 
 Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetDialog --url %url% --chat %chat% --token %token%

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
 "counter": 1,
 "user_counter": 0,
 "message_count": 24,
 "unread_id": 3854,
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
 "last_message_id": 5262,
 "last_id": 3852,
 "marked_id": 0,
 "disk_folder_id": 0,
 "entity_type": "",
 "entity_id": "",
 "entity_data_1": "",
 "entity_data_2": "",
 "entity_data_3": "",
 "mute_list": [],
 "date_create": "2024-06-15T16:48:49+00:00",
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
 "message_id": 5262,
 "first_viewers": [],
 "count_of_viewers": 0
 },
 "dialog_id": "10"
 },
 "time": {
 "start": 1720969160.19046,
 "finish": 1720969160.22782,
 "duration": 0.037362813949585,
 "processing": 0.0134620666503906,
 "date_start": "2024-07-14T14:59:20+00:00",
 "date_finish": "2024-07-14T14:59:20+00:00",
 "operating_reset_at": 1720969760,
 "operating": 0
 }
}
```
