﻿---
sidebar_position: 2
---

# Update tasks checklist element
 Updates text of element of tasks checklist



`Function UpdateTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Text, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | ElementID | --element | Number, String | Checklist element ID |
  | Text | --text | String | Text (title) of checklist element |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/update.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2262";
    ElementID = "1344";

    Text = "New elements text";

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text);

    URL       = "b24-ar17wx.bitrix24.by";
    Token     = "37d1fe66006e9f06006b12e400000001000...";
    TaskID    = "2264";
    ElementID = "1348";

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateTasksChecklistElement --url "b24-ar17wx.bitrix24.by" --task "1080" --element "400" --text %text% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": null,
 "time": {
  "start": 1728140728.96019,
  "finish": 1728140729.02081,
  "duration": 0.0606200695037842,
  "processing": 0.0308821201324463,
  "date_start": "2024-10-05T18:05:28+03:00",
  "date_finish": "2024-10-05T18:05:29+03:00",
  "operating_reset_at": 1728141328,
  "operating": 0
 }
}
```
