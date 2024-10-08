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
  "ID": 12420,
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "12402",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8554,
  "SIZE": "805191",
  "CREATE_TIME": "2024-10-07T22:25:41+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:41+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTI0MjAmXz1tNVFlRmVKYUh6MFBvZTZPbkpLUVlMSldOSmc3M1Z0Tg%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USTBNakFtWHoxdE5WRmxSbVZLWVVoNk1GQnZaVFpQYmtwTFVWbE1TbGRPU21jM00xWjBUZz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.guNxvbe8decpn4KF7R4DH45plCZbY6%2FpAYpE0jItmQM%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/Picture1.jpg"
 }
}
```
