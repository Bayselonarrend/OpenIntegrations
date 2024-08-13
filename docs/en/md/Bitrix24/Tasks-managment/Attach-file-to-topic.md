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
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    TaskID = "1078";
    FileID = "5006";

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "fe3fa966006e9f06006b12e400000001000...";
    TaskID = "1080";

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 AttachFileToTopic --url "b24-ar17wx.bitrix24.by" --task "1080" --fileid "5006" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "attachmentId": 598
  },
  "time": {
  "start": 1720017736.90778,
  "finish": 1720017736.97555,
  "duration": 0.0677700042724609,
  "processing": 0.0367820262908936,
  "date_start": "2024-07-03T14:42:16+00:00",
  "date_finish": "2024-07-03T14:42:16+00:00",
  "operating_reset_at": 1720018336,
  "operating": 0
  }
  }
```
