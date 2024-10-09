---
sidebar_position: 7
---

# Get folder child elements
 Get folder child elements



`Function GetFolderItems(Val URL, Val FolderID, Val Filter = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FolderID | --folderid | String, Number | Folder identifier |
  | Filter | --filter | Structure of KeyAndValue | Items filter (see GetFolderFilterStructure) |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getchildren.php)
:::
<br/>


```bsl title="Code example"
    URL      = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FolderID = "10842";

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFolderItems --url "b24-ar17wx.bitrix24.by" --folderid "5016" --filter %filter% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "12584",
   "NAME": "New subfolder 2",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12584",
   "PARENT_ID": "12582",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-09T09:20:24+03:00",
   "UPDATE_TIME": "2024-10-09T09:20:25+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder 2"
  },
  {
   "ID": "12586",
   "NAME": "New subfolder",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12586",
   "PARENT_ID": "12582",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-09T09:20:24+03:00",
   "UPDATE_TIME": "2024-10-09T09:20:25+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder"
  },
  {
   "ID": "12604",
   "NAME": "New file name.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "12582",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8678",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-09T09:20:28+03:00",
   "UPDATE_TIME": "2024-10-09T09:20:28+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=6b2e0667006e9f06006b12e4000000010000072c4914d2a629a27f8e468fd6a8ba64ff&token=disk%7CaWQ9MTI2MDQmXz03bHFpaTl0bjV6aFk1SnFVY0szYU5RMVNSRHlWb2ZwcA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTJNRFFtWHowM2JIRnBhVGwwYmpWNmFGazFTbkZWWTBzellVNVJNVk5TUkhsV2IyWndjQT09fDZiMmUwNjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MmM0OTE0ZDJhNjI5YTI3ZjhlNDY4ZmQ2YThiYTY0ZmYi.SL6HjOaIdsjTX1Tik1rou9x26mZ6E8LBmyKI4jcVsps%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
  }
 ],
 "total": 3,
 "time": {
  "start": 1728454829.29148,
  "finish": 1728454829.32633,
  "duration": 0.0348570346832275,
  "processing": 0.00847411155700684,
  "date_start": "2024-10-09T09:20:29+03:00",
  "date_finish": "2024-10-09T09:20:29+03:00",
  "operating_reset_at": 1728455429,
  "operating": 0
 }
}
```
