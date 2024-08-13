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
  URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  FileID = "5010";
  
  Result = OPI_Bitrix24.GetFileInformation(URL, FileID);
  
  URL   = "b24-ar17wx.bitrix24.by";
  Token = "fe3fa966006e9f06006b12e400000001000...";
  
  Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFileInformation --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": {
  "ID": "1716",
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": "0",
  "GLOBAL_CONTENT_VERSION": "1",
  "FILE_ID": "1134",
  "SIZE": "805189",
  "CREATE_TIME": "2024-07-03T14:42:28+00:00",
  "UPDATE_TIME": "2024-07-03T14:42:28+00:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": "0",
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTcxNiZfPXJDbEFhcE51RG5ZZ0hwUVhJbXhybGRpUzhjbG82SHFO%7CImRvd25sb2FkfGRpc2t8YVdROU1UY3hOaVpmUFhKRGJFRmhjRTUxUkc1WlowaHdVVmhKYlhoeWJHUnBVemhqYkc4MlNIRk98ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.h344gCFe%2FeGei7hNDt%2FfG%2FqauSX2zpt%2BnX3KnR66llA%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
  },
  "time": {
  "start": 1720017751.37945,
  "finish": 1720017751.42512,
  "duration": 0.0456681251525879,
  "processing": 0.0131018161773682,
  "date_start": "2024-07-03T14:42:31+00:00",
  "date_finish": "2024-07-03T14:42:31+00:00",
  "operating_reset_at": 1720018351,
  "operating": 0
  }
  }
```
