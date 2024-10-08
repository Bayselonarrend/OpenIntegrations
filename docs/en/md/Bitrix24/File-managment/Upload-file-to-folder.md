﻿---
sidebar_position: 2
---

# Upload file to the folder
 Upload local file to the folder



`Function UploadFileToFolder(Val URL, Val Name, Val File, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Name | --title | String | File name with extension |
  | File | --file | String, BinaryData | File for upload |
  | FolderID | --folderid | String | Folder identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_uploadfile.php)
:::
<br/>


```bsl title="Code example"
    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = "https://openyellow.neocities.org/test_data/picture.jpg"; // Local path, URL or Binary Data
    Image  = "https://openyellow.neocities.org/test_data/picture2.jpg"; // Local path, URL or Binary Data

    DestinationID = "10842";

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Filename2, Image2, DestinationID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UploadFileToFolder --url "b24-ar17wx.bitrix24.by" --title "Picture1.jpg" --file %file% --folderid %folderid% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": 12600,
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12582",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8674,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-09T09:20:27+03:00",
  "UPDATE_TIME": "2024-10-09T09:20:28+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=6b2e0667006e9f06006b12e4000000010000072c4914d2a629a27f8e468fd6a8ba64ff&token=disk%7CaWQ9MTI2MDAmXz13R0UzRTVSSkd0QjdkRG50RUlNRXFPTW9YOXY4ZDJSdQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTJNREFtWHoxM1IwVXpSVFZTU2tkMFFqZGtSRzUwUlVsTlJYRlBUVzlZT1hZNFpESlNkUT09fDZiMmUwNjY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MmM0OTE0ZDJhNjI5YTI3ZjhlNDY4ZmQ2YThiYTY0ZmYi.Cqt7v%2BQbuicLFUvKMHOeSmN9P5txXsdUHdLBs9FfHOU%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/Picture1.jpg"
 }
}
```
