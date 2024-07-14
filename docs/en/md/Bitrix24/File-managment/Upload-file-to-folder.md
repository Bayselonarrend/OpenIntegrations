---
sidebar_position: 2
---

# Upload file to the folder
 Upload local file to the folder



`Function UploadFileToFolder(Val URL, Val Name, Val File, Val FolderID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Name | --title | String | File name with extension |
 | File | --file | String, BinaryData | File for upload |
 | FolderID | --folderid | String | Folder identifier |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.folder.uploadfile](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_uploadfile.php)
:::
<br/>


```bsl title="Code example"
 Filename2 = "Picture2.jpg";
 Name = "Picture1.jpg";
 
 Image2 = "https://openintegrations.dev/test_data/picture.jpg"; // Local path, URL or Binary Data
 Image = "https://openintegrations.dev/test_data/picture2.jpg"; // Local path, URL or Binary Data
 
 DestinationID = "3278";
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.UploadFileToFolder(URL, Filename2, Image2, DestinationID);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 UploadFileToFolder --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --folderid %folderid% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
 "ID": 1740,
 "NAME": "Picture1.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": "1722",
 "DELETED_TYPE": 0,
 "GLOBAL_CONTENT_VERSION": 1,
 "FILE_ID": 1142,
 "SIZE": "805189",
 "CREATE_TIME": "2024-07-03T14:42:52+00:00",
 "UPDATE_TIME": "2024-07-03T14:42:52+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": null,
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=fe708566006e9f06006b12e4000000010000076fcba303ea853529aed2cefade1444b3&token=disk%7CaWQ9MTc0MCZfPTFqN3RzcGx4UndmRkk0cmlvVGVFQUEzQ05lOHZ0U1RR%7CImRvd25sb2FkfGRpc2t8YVdROU1UYzBNQ1pmUFRGcU4zUnpjR3g0VW5kbVJrazBjbWx2VkdWRlFVRXpRMDVsT0haMFUxUlJ8ZmU3MDg1NjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDc2ZmNiYTMwM2VhODUzNTI5YWVkMmNlZmFkZTE0NDRiMyI%3D.yWcwutXSoxydbwTQ7d1Aapgpo69Iyc2LhhtmuH442Uo%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/New catalog/Picture1.jpg"
 }
}
```
