---
sidebar_position: 19
---

# Get task history
 Get history of task changing



`Function GetTaskHistory(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.history.list](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_history_list.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskHistory --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "list": [
   {
    "id": "28918",
    "createdDate": "05.10.2024 18:05:13",
    "field": "NEW",
    "value": {
     "from": null,
     "to": null
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28920",
    "createdDate": "05.10.2024 18:05:18",
    "field": "START_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728140713"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28922",
    "createdDate": "05.10.2024 18:05:18",
    "field": "END_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728162000"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28924",
    "createdDate": "05.10.2024 18:05:18",
    "field": "DURATION_PLAN_SECONDS",
    "value": {
     "from": "",
     "to": "21287"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28938",
    "createdDate": "05.10.2024 18:05:20",
    "field": "TITLE",
    "value": {
     "from": "New task",
     "to": "Another task title"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28940",
    "createdDate": "05.10.2024 18:05:20",
    "field": "DESCRIPTION",
    "value": {
     "from": "",
     "to": ""
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28942",
    "createdDate": "05.10.2024 18:05:20",
    "field": "PRIORITY",
    "value": {
     "from": "2",
     "to": "1"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28948",
    "createdDate": "05.10.2024 18:05:21",
    "field": "RESPONSIBLE_ID",
    "value": {
     "from": "1",
     "to": "570"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28950",
    "createdDate": "05.10.2024 18:05:21",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "5756"
    },
    "user": {
     "id": "1",
     "name": "Антон",
     "lastName": "Титовец",
     "secondName": null,
     "login": "VKuser657846756"
    }
   },
   {
    "id": "28954",
    "createdDate": "05.10.2024 18:05:22",
...
```
