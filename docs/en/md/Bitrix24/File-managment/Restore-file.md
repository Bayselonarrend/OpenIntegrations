---
sidebar_position: 7
---

# Restore file
 Restore file from recycle bin



`Function RestoreFile(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.restore](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_restore.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "6874";

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "ec4dc366006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 RestoreFile --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "1716",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "1134",
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:28+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:36+00:00",
  "DELETE_TIME": "2024-07-03T14:42:34+00:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPWs2c1VzV3l4ZkVmRG5PY1JYSGdibHNxZzJ1S2pGbDNC%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFdzMmMxVnpWM2w0WmtWbVJHNVBZMUpZU0dkaWJITnhaekoxUzJwR2JETkN8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.iv0WpvLa68S5kviQk96g9dRPVonwvrxN7T6AunrAW9s%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New file name.jpg"
  },
  "time": {
  "start": 1720017756.65038,
  "finish": 1720017756.69349,
  "duration": 0.0431070327758789,
  "processing": 0.0107128620147705,
  "date_start": "2024-07-03T14:42:36+00:00",
  "date_finish": "2024-07-03T14:42:36+00:00",
  "operating_reset_at": 1720018356,
  "operating": 0
  }
  }
```
