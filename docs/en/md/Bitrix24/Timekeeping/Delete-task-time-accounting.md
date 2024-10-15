---
sidebar_position: 2
---

# Delete task time accounting
 Deletes record of time accounting



`Function DeleteTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | ID of task for time accounting |
  | RecordID | --record | String, Number | Time record ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.delete](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/delete.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID   = "2424";
    RecordID = "836";

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID);

    URL      = "b24-ar17wx.bitrix24.by";
    Token    = "49e20867006e9f06006b12e400000001000...";
    RecordID = "838";

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID, Token);
```
 



```json title="Result"
{
 "result": null,
 "time": {
  "start": 1728454838.38759,
  "finish": 1728454838.44759,
  "duration": 0.0600039958953857,
  "processing": 0.0322821140289307,
  "date_start": "2024-10-09T09:20:38+03:00",
  "date_finish": "2024-10-09T09:20:38+03:00",
  "operating_reset_at": 1728455438,
  "operating": 0
 }
}
```
