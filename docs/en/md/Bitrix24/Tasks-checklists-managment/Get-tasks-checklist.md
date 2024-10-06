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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTasksChecklist --url "b24-ar17wx.bitrix24.by" --task "1080" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "1394",
   "TASK_ID": "2318",
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
   "ID": "1396",
   "TASK_ID": "2318",
   "PARENT_ID": "1394",
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
  "start": 1728140729.17441,
  "finish": 1728140729.23459,
  "duration": 0.0601871013641357,
  "processing": 0.0285658836364746,
  "date_start": "2024-10-05T18:05:29+03:00",
  "date_finish": "2024-10-05T18:05:29+03:00",
  "operating_reset_at": 1728141329,
  "operating": 0
 }
}
```
