---
sidebar_position: 19
---

# Get task history
 Get history of task changing




<br/>


*Function GetTaskHistory(Val URL, Val TaskID, Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | TaskID | --task | Number, String | Task ID |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 TaskID = "168";
 
 Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 TaskID = "170";
 
 Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetTaskHistory --url "b24-ar17wx.bitrix24.by" --task "170" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
 {
 "result": {
 "list": [
 {
 "id": "1044",
 "createdDate": "19.06.2024 10:57:54",
 "field": "NEW",
 "value": {
 "from": null,
 "to": null
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1052",
 "createdDate": "19.06.2024 10:58:01",
 "field": "TITLE",
 "value": {
 "from": "New task",
 "to": "Another task title"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1054",
 "createdDate": "19.06.2024 10:58:01",
 "field": "DESCRIPTION",
 "value": {
 "from": "",
 "to": ""
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1056",
 "createdDate": "19.06.2024 10:58:01",
 "field": "PRIORITY",
 "value": {
 "from": "2",
 "to": "1"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1064",
 "createdDate": "19.06.2024 10:58:08",
 "field": "RESPONSIBLE_ID",
 "value": {
 "from": "1",
 "to": "10"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1066",
 "createdDate": "19.06.2024 10:58:08",
 "field": "AUDITORS",
 "value": {
 "from": "",
 "to": "1"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1068",
 "createdDate": "19.06.2024 10:58:08",
 "field": "COMMENT",
 "value": {
 "from": null,
 "to": "406"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1072",
 "createdDate": "19.06.2024 10:58:10",
 "field": "STATUS",
 "value": {
 "from": "2",
 "to": "6"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1078",
 "createdDate": "19.06.2024 10:58:12",
 "field": "STATUS",
 "value": {
 "from": "6",
 "to": "5"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1080",
 "createdDate": "19.06.2024 10:58:12",
 "field": "COMMENT",
 "value": {
 "from": null,
 "to": "410"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1086",
 "createdDate": "19.06.2024 10:58:16",
 "field": "STATUS",
 "value": {
 "from": "5",
 "to": "2"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1088",
 "createdDate": "19.06.2024 10:58:17",
 "field": "COMMENT",
 "value": {
 "from": null,
 "to": "414"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1092",
 "createdDate": "19.06.2024 10:58:18",
 "field": "STATUS",
 "value": {
 "from": "2",
 "to": "3"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1096",
 "createdDate": "19.06.2024 10:58:22",
 "field": "AUDITORS",
 "value": {
 "from": "1",
 "to": ""
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 },
 {
 "id": "1100",
 "createdDate": "19.06.2024 10:58:23",
 "field": "STATUS",
 "value": {
 "from": "3",
 "to": "2"
 },
 "user": {
 "id": "1",
 "name": "Anton",
 "lastName": "Titovets",
 "secondName": null,
 "login": "VKuser657846756"
 }
 }
 ]
 },
 "time": {
 "start": 1718783905.33427,
 "finish": 1718783905.37664,
 "duration": 0.0423648357391357,
 "processing": 0.00563311576843262,
 "date_start": "2024-06-19T07:58:25+00:00",
 "date_finish": "2024-06-19T07:58:25+00:00",
 "operating_reset_at": 1718784505,
 "operating": 0
 }
}
```
