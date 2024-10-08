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
    "id": "29548",
    "createdDate": "07.10.2024 22:24:46",
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
    "id": "29550",
    "createdDate": "07.10.2024 22:24:51",
    "field": "START_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728329086"
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
    "id": "29552",
    "createdDate": "07.10.2024 22:24:51",
    "field": "END_DATE_PLAN",
    "value": {
     "from": "",
     "to": "1728334800"
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
    "id": "29554",
    "createdDate": "07.10.2024 22:24:51",
    "field": "DURATION_PLAN_SECONDS",
    "value": {
     "from": "",
     "to": "5714"
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
    "id": "29568",
    "createdDate": "07.10.2024 22:24:53",
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
    "id": "29570",
    "createdDate": "07.10.2024 22:24:53",
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
    "id": "29572",
    "createdDate": "07.10.2024 22:24:53",
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
    "id": "29578",
    "createdDate": "07.10.2024 22:24:54",
    "field": "RESPONSIBLE_ID",
    "value": {
     "from": "1",
     "to": "590"
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
    "id": "29580",
    "createdDate": "07.10.2024 22:24:55",
    "field": "COMMENT",
    "value": {
     "from": null,
     "to": "5866"
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
    "id": "29584",
    "createdDate": "07.10.2024 22:24:55",
...
```
