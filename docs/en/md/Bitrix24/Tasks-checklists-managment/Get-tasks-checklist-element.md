---
sidebar_position: 5
---

# Get tasks checklist element
 Gets tasks checklist element by ID



`Function GetTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | ElementID | --element | Number, String | Element ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.get](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/get.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    TaskID    = "1078";
    ElementID = "396";

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    TaskID    = "1080";
    ElementID = "400";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTasksChecklistElement --url "b24-ar17wx.bitrix24.by" --task "1080" --element "400" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "96",
  "TASK_ID": "632",
  "PARENT_ID": "94",
  "CREATED_BY": "1",
  "TITLE": "New elements text",
  "SORT_INDEX": "1",
  "IS_COMPLETE": "N",
  "IS_IMPORTANT": "N",
  "TOGGLED_BY": null,
  "TOGGLED_DATE": "",
  "MEMBERS": [],
  "ATTACHMENTS": []
  },
  "time": {
  "start": 1720816508.81324,
  "finish": 1720816508.85536,
  "duration": 0.0421209335327148,
  "processing": 0.0174088478088379,
  "date_start": "2024-07-12T20:35:08+00:00",
  "date_finish": "2024-07-12T20:35:08+00:00",
  "operating_reset_at": 1720817108,
  "operating": 0
  }
  }
```
