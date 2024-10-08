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
   "ID": "12404",
   "NAME": "New subfolder 2",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12404",
   "PARENT_ID": "12402",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T22:25:38+03:00",
   "UPDATE_TIME": "2024-10-07T22:25:38+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder 2"
  },
  {
   "ID": "12406",
   "NAME": "New subfolder",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "folder",
   "REAL_OBJECT_ID": "12406",
   "PARENT_ID": "12402",
   "DELETED_TYPE": "0",
   "CREATE_TIME": "2024-10-07T22:25:38+03:00",
   "UPDATE_TIME": "2024-10-07T22:25:38+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/path/New catalog/New subfolder"
  },
  {
   "ID": "12424",
   "NAME": "New file name.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "12402",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8558",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T22:25:41+03:00",
   "UPDATE_TIME": "2024-10-07T22:25:41+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTI0MjQmXz1MckhKUDZ1a0dselNQVFRLN0VJbGpKYk5QMm0wSkwwQg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTBNalFtWHoxTWNraEtVRFoxYTBkc2VsTlFWRlJMTjBWSmJHcEtZazVRTW0wd1Nrd3dRZz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.Y%2FmtCTj%2Fi9sR8frmXkbRazM3HdhLdS9T0ddJbhqzed0%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/New file name.jpg"
  }
 ],
 "total": 3,
 "time": {
  "start": 1728329142.25952,
  "finish": 1728329142.29291,
  "duration": 0.0333878993988037,
  "processing": 0.00758910179138184,
  "date_start": "2024-10-07T22:25:42+03:00",
  "date_finish": "2024-10-07T22:25:42+03:00",
  "operating_reset_at": 1728329742,
  "operating": 0
 }
}
```
