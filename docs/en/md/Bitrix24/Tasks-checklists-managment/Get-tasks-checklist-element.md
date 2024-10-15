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
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID    = "2416";
    ElementID = "1472";

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    TaskID    = "2418";
    ElementID = "1476";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "49e20867006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);
```
 



```json title="Result"
{
 "result": {
  "ID": "1460",
  "TASK_ID": "2398",
  "PARENT_ID": "1458",
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
  "start": 1728454786.80187,
  "finish": 1728454786.86049,
  "duration": 0.0586211681365967,
  "processing": 0.0263149738311768,
  "date_start": "2024-10-09T09:19:46+03:00",
  "date_finish": "2024-10-09T09:19:46+03:00",
  "operating_reset_at": 1728455386,
  "operating": 0
 }
}
```
