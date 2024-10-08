﻿---
sidebar_position: 1
---

# Add tasks checklist element
 Adds new element of tasks checklist



`Function AddTasksChecklistElement(Val URL, Val TaskID, Val Text, Val Completed = False, Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | Text | --text | String | Text (title) of checklist element |
  | Completed | --complete | Boolean | Mark as completed |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.add](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/add.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Text = "Checklist element";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AddTasksChecklistElement --url "b24-ar17wx.bitrix24.by" --task "1080" --text "Checklist element" --complete %complete% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 1460,
 "time": {
  "start": 1728454786.04734,
  "finish": 1728454786.13143,
  "duration": 0.0840880870819092,
  "processing": 0.0545477867126465,
  "date_start": "2024-10-09T09:19:46+03:00",
  "date_finish": "2024-10-09T09:19:46+03:00",
  "operating_reset_at": 1728455386,
  "operating": 0
 }
}
```
