---
sidebar_position: 9
---

# Move file
 Move file from one destination to another



`Function MoveFileToFolder(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File ID |
  | FolderID | --folderid | String, Number | ID of new destination folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.moveto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_moveto.php)
:::
<br/>


```bsl title="Code example"
    FolderID = "10844";
    FileID   = "10836";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    FolderID = "10846";

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MoveFileToFolder --url "b24-ar17wx.bitrix24.by" --fileid "5010" --folderid "5020" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12396",
  "NAME": "New file name.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": 12406,
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8546",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T22:25:16+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:37+03:00",
  "DELETE_TIME": "2024-10-07T22:25:36+03:00",
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "1",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz1aUzJVT2hRM25LNGE2TDFWb0ZUUkxZWThlNUpnN2RQTw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxYVV6SlZUMmhSTTI1TE5HRTJUREZXYjBaVVVreFpXVGhsTlVwbk4yUlFUdz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.GJQw8UDZ37PZdibpjS5rZV6bMTv9UXf8nu1kWsSqCNE%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New subfolder/New file name.jpg"
 },
 "time": {
  "start": 1728329138.55998,
  "finish": 1728329138.61872,
  "duration": 0.058743953704834,
  "processing": 0.0241889953613281,
  "date_start": "2024-10-07T22:25:38+03:00",
  "date_finish": "2024-10-07T22:25:38+03:00",
  "operating_reset_at": 1728329738,
  "operating": 0
 }
}
```
