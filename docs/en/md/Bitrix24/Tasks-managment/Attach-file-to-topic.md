---
sidebar_position: 6
---

# Attach file to the topic
 Attaches a file to the selected task



`Function AttachFileToTopic(Val URL, Val TaskID, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | TaskID | --task | Number, String | Task ID |
  | FileID | --fileid | Number, String | File ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [tasks.task.files.attach](https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_files_attach.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    TaskID = "2262";
    FileID = "11778";

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    TaskID = "2264";

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AttachFileToTopic --url "b24-ar17wx.bitrix24.by" --task "1080" --fileid "5006" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "attachmentId": 3558
 },
 "time": {
  "start": 1728329105.65456,
  "finish": 1728329105.72063,
  "duration": 0.0660750865936279,
  "processing": 0.0390539169311523,
  "date_start": "2024-10-07T22:25:05+03:00",
  "date_finish": "2024-10-07T22:25:05+03:00",
  "operating_reset_at": 1728329705,
  "operating": 0
 }
}
```
