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
  "ID": 12096,
  "NAME": "Picture1.jpg",
  "CODE": null,
  "STORAGE_ID": "3",
  "TYPE": "file",
  "PARENT_ID": "3",
  "DELETED_TYPE": 0,
  "GLOBAL_CONTENT_VERSION": 1,
  "FILE_ID": 8346,
  "SIZE": "805189",
  "CREATE_TIME": "2024-10-05T18:05:43+03:00",
  "UPDATE_TIME": "2024-10-05T18:05:43+03:00",
  "DELETE_TIME": null,
  "CREATED_BY": "1",
  "UPDATED_BY": "1",
  "DELETED_BY": null,
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz14djlQYnBhb2wzbHExYk14VjgxTEYzcGpLRVl6ZEIxeQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxNGRqbFFZbkJoYjJ3emJIRXhZazE0VmpneFRFWXpjR3BMUlZsNlpFSXhlUT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.VN21J5y5czwQI%2BllQBSWbvLaBwSDx36IHEa6IPG49Hk%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
 },
 "time": {
  "start": 1728140742.84611,
  "finish": 1728140743.13067,
  "duration": 0.284556150436401,
  "processing": 0.258487939834595,
  "date_start": "2024-10-05T18:05:42+03:00",
  "date_finish": "2024-10-05T18:05:43+03:00",
  "operating_reset_at": 1728141342,
  "operating": 0.258463859558105
 }
}
```
