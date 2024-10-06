---
sidebar_position: 3
---

# Get task time accounting list
 Get list of time accounting records for task



`Function GetTaskTimeAccountingList(Val URL, Val TaskID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | Task ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.getlist](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/getlist.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2112";

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetTaskTimeAccountingList --url "b24-ar17wx.bitrix24.by" --task "1088" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "796",
   "TASK_ID": "2324",
   "USER_ID": "1",
   "COMMENT_TEXT": "",
   "SECONDS": "3600",
   "MINUTES": "60",
   "SOURCE": "2",
   "CREATED_DATE": "2024-10-05T18:06:16+03:00",
   "DATE_START": "2024-10-05T18:06:16+03:00",
   "DATE_STOP": "2024-10-05T18:06:16+03:00"
  },
  {
   "ID": "798",
   "TASK_ID": "2324",
   "USER_ID": "10",
   "COMMENT_TEXT": "Time spent on work",
   "SECONDS": "7200",
   "MINUTES": "120",
   "SOURCE": "2",
   "CREATED_DATE": "2024-09-05T18:06:16+03:00",
   "DATE_START": "2024-10-05T18:06:16+03:00",
   "DATE_STOP": "2024-10-05T18:06:16+03:00"
  }
 ],
 "total": 2,
 "time": {
  "start": 1728140776.99043,
  "finish": 1728140777.03976,
  "duration": 0.0493230819702148,
  "processing": 0.0210220813751221,
  "date_start": "2024-10-05T18:06:16+03:00",
  "date_finish": "2024-10-05T18:06:17+03:00",
  "operating_reset_at": 1728141377,
  "operating": 0
 }
}
```
