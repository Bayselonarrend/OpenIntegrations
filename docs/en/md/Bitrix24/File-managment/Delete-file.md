﻿---
sidebar_position: 4
---

# Delete file
 Delete file by ID



`Function DeleteFile(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | ID of removing file |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.delete](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_delete.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "10834";

    Result = OPI_Bitrix24.DeleteFile(URL, FileID);

    URL    = "b24-ar17wx.bitrix24.by";
    Token  = "37d1fe66006e9f06006b12e400000001000...";
    FileID = "10836";

    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 DeleteFile --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
  "start": 1728454828.81245,
  "finish": 1728454828.89366,
  "duration": 0.0812110900878906,
  "processing": 0.0537998676300049,
  "date_start": "2024-10-09T09:20:28+03:00",
  "date_finish": "2024-10-09T09:20:28+03:00",
  "operating_reset_at": 1728455428,
  "operating": 0.125946998596191
 }
}
```
