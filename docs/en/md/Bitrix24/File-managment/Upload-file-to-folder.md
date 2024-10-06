---
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
  "ID": 12120,
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12102",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8354,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-05T18:06:08+03:00",
  "UPDATE_TIME": "2024-10-05T18:06:08+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIxMjAmXz10Zjd3c2g5WVd4WVRvTTJPdTRXOGhFUXdVYzFIUEo3bg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXhNakFtWHoxMFpqZDNjMmc1V1ZkNFdWUnZUVEpQZFRSWE9HaEZVWGRWWXpGSVVFbzNiZz09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.hxeaijazbDUQRDIfK21EDY8AyOGrxiQb53%2F%2F%2BvIwYOY%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/Picture1.jpg"
 }
}
```
