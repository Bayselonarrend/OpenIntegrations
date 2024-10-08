---
sidebar_position: 1
---

# Upload file to a storage
 Upload file to storage root



`Function UploadFileToStorage(Val URL, Val Name, Val File, Val StorageID, Val Rights = "", Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | Name | --title | String | File name with extension |
  | File | --file | String, BinaryData | File for upload |
  | StorageID | --storageid | String | Storage id |
  | Rights | --rights | String | Rights array if required |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_uploadfile.php)
:::
<br/>


```bsl title="Code example"
    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = "https://openyellow.neocities.org/test_data/picture.jpg"; // Local path, URL or Binary Data
    Image  = "https://openyellow.neocities.org/test_data/picture2.jpg"; // Local path, URL or Binary Data

    DestinationID = 3;

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);
```



```sh title="CLI command example"
    
  oint bitrix24 UploadFileToStorage --url "b24-ar17wx.bitrix24.by" --title "Picture1.jpg" --file %file% --storageid %storageid% --rights %rights% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
  "ID": 12396,
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8546,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-07T22:25:16+03:00",
  "UPDATE_TIME": "2024-10-07T22:25:16+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz1pOENtd0g3UFUzcnJRcWVhS2RKUUoxQ3RQaTdwdXQ2cQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxcE9FTnRkMGczVUZVemNuSlJjV1ZoUzJSS1VVb3hRM1JRYVRkd2RYUTJjUT09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.T14ut3Z7QwQNzkQxNbYTbLVbpWtul%2F11JRZqK4C4pvk%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
 },
 "time": {
  "start": 1728329115.86062,
  "finish": 1728329116.20064,
  "duration": 0.340019941329956,
  "processing": 0.310253143310547,
  "date_start": "2024-10-07T22:25:15+03:00",
  "date_finish": "2024-10-07T22:25:16+03:00",
  "operating_reset_at": 1728329715,
  "operating": 0.31023097038269
 }
}
```
