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
...
```
