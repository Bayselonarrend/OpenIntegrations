---
sidebar_position: 4
---

# Get tasks checklist
 Gets the list of elements on the task checklist



`Function GetTasksChecklist(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/getlist.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    TaskID = "1078";

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    TaskID = "1080";

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTasksChecklist --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
  {
  "result": [
  {
  "ID": "94",
  "TASK_ID": "632",
  "PARENT_ID": 0,
  "CREATED_BY": "1",
  "TITLE": "BX_CHECKLIST_1",
  "SORT_INDEX": "0",
  "IS_COMPLETE": "N",
  "IS_IMPORTANT": "N",
  "TOGGLED_BY": null,
  "TOGGLED_DATE": "",
  "MEMBERS": [],
  "ATTACHMENTS": []
  },
  {
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
  }
  ],
  "time": {
  "start": 1720816507.68937,
  "finish": 1720816507.74166,
  "duration": 0.0522880554199219,
  "processing": 0.0231881141662598,
  "date_start": "2024-07-12T20:35:07+00:00",
  "date_finish": "2024-07-12T20:35:07+00:00",
  "operating_reset_at": 1720817107,
  "operating": 0
  }
  }

```
