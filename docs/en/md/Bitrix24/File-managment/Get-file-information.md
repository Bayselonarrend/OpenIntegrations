---
sidebar_position: 3
---

# Get information about file
 Get information about file by ID



`Function GetFileInformation(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.get](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_get.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "10836";

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFileInformation --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": "12096",
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "8346",
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:05:43+03:00",
  "UPDATE_TIME": "2024-10-05T18:05:43+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz1zczYwTXRIbkF1RVlvdWFGQkNmSXBTbzVNa0NUWWRiSA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxemN6WXdUWFJJYmtGMVJWbHZkV0ZHUWtObVNYQlRielZOYTBOVVdXUmlTQT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.%2Bls%2FxikFhVcV8oL9Zf4n65%2BpjYol98ZgFbVUvqtbpPU%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
 },
 "time": {
  "start": 1728140743.45806,
  "finish": 1728140743.49554,
  "duration": 0.0374720096588135,
  "processing": 0.00664401054382324,
  "date_start": "2024-10-05T18:05:43+03:00",
  "date_finish": "2024-10-05T18:05:43+03:00",
  "operating_reset_at": 1728141343,
  "operating": 0
 }
}
```
