---
sidebar_position: 3
---

# Delete tasks checklist element
 Deletes element from tasks checklist



`Function DeleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | ElementID | --element | Number, String | ID of deleted element |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.checklistitem.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/delete.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2262";
    ElementID = "1344";

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);

    TaskID    = "2264";
    ElementID = "1348";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteTasksChecklistElement --url "b24-ar17wx.bitrix24.by" --task "1080" --element "400" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728140730.07021,
  "finish": 1728140730.13891,
  "duration": 0.0687031745910644,
  "processing": 0.0379829406738281,
  "date_start": "2024-10-05T18:05:30+03:00",
  "date_finish": "2024-10-05T18:05:30+03:00",
  "operating_reset_at": 1728141330,
  "operating": 0
 }
}
```
