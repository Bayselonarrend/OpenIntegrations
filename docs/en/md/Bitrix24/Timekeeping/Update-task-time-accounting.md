---
sidebar_position: 5
---

# Update task time accounting
 Update time accounting record data



`Function UpdateTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Time, Val Text = "", Val SetupDate = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | String, Number | Task ID |
  | RecordID | --record | String, Number | Time record ID |
  | Time | --amount | String, Number | Time spent in seconds |
  | Text | --text | String | Comment text |
  | SetupDate | --date | String | Date the record was set |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [task.elapseditem.update](https://dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/update.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID   = "2112";
    RecordID = "714";

    Text = "The text I forgot last time";
    Time = 4800;

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text);

    URL      = "b24-ar17wx.bitrix24.by";
    Token    = "37d1fe66006e9f06006b12e400000001000...";
    RecordID = "716";

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL
        , TaskID
        , RecordID
        , Time
        , Text
        , SetupDate
        , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UpdateTaskTimeAccounting --url "b24-ar17wx.bitrix24.by" --task "1088" --record "308" --amount "4800" --text "The text I forgot last time" --date %date% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": null,
 "time": {
  "start": 1728140777.20133,
  "finish": 1728140777.25245,
  "duration": 0.0511128902435303,
  "processing": 0.0268139839172363,
  "date_start": "2024-10-05T18:06:17+03:00",
  "date_finish": "2024-10-05T18:06:17+03:00",
  "operating_reset_at": 1728141377,
  "operating": 0
 }
}
```
