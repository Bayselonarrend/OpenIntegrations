---
sidebar_position: 15
---

# Get chat members list
 Get chat members list



`Function GetChatMembersList(Val URL, Val ChatID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | ChatID | --chat | String, Number | Chat ID (as chatXXX) or User ID (as XXX) |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.dialog.users.list](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23800)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
 ChatID = "chat" + "450";
 
 Result = OPI_Bitrix24.GetChatMembersList(URL, ChatID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 UserID = 10;
 
 Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetChatMembersList --url %url% --chat %chat% --token %token%

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
 "last_activity_date": "2024-07-13T18:36:23+00:00",
 "mobile_last_date": false,
 "absent": false,
 "departments": [
 1
 ],
 "phones": false,
 "bot_data": null
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
 "bot_data": null
 }
 ],
 "total": 2,
 "time": {
 "start": 1720969161.4388,
 "finish": 1720969161.46946,
 "duration": 0.0306570529937744,
 "processing": 0.00571608543395996,
 "date_start": "2024-07-14T14:59:21+00:00",
 "date_finish": "2024-07-14T14:59:21+00:00",
 "operating_reset_at": 1720969761,
 "operating": 0
 }
}
```
