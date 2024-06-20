---
sidebar_position: 6
---

# Upload file to a storage
 Upload file to storage root


*Function UploadFileToStorage(Val URL, Val Name, Val File, Val StorageID, Val Rights = "", Val Token = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Name | --title | String | File name with extension |
 | File | --file | String, BinaryData | File for upload |
 | StorageID | --storageid | String | Storage id |
 | Rights | --rights | String | Rights array if required |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

```bsl title="Code example"
	
 Filename2 = "Picture2.jpg";
 Name = "Picture1.jpg";
 
 Image2 = "https://openintegrations.dev/test_data/picture.jpg"; // Local path, URL or Binary Data
 Image = "https://openintegrations.dev/test_data/picture2.jpg"; // Local path, URL or Binary Data
 
 DestinationID = 3;
 
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);
 
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "b9df7366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID,, Token);
	
```

```sh title="CLI command example"
 
oint bitrix24 UploadFileToStorage --url "b24-ar17wx.bitrix24.by" --title %title% --file %file% --storageid %storageid% --rights %rights% --token "b9df7366006e9f06006b12e400000001000..."

```


```json title="Result"

{
 "result": {
 "ID": 356,
 "NAME": "26417397-8431-4343-9c0f-a40d4a2831c8.jpg",
 "CODE": null,
 "STORAGE_ID": "3",
 "TYPE": "file",
 "PARENT_ID": "3",
 "DELETED_TYPE": 0,
 "GLOBAL_CONTENT_VERSION": 1,
 "FILE_ID": 404,
 "SIZE": "26",
 "CREATE_TIME": "2024-06-19T07:58:50+00:00",
 "UPDATE_TIME": "2024-06-19T07:58:50+00:00",
 "DELETE_TIME": null,
 "CREATED_BY": "1",
 "UPDATED_BY": "1",
 "DELETED_BY": null,
 "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=0a9d7266006e9f06006b12e40000000100000702aaae0c0e99153466d165ecfa4a92ce&token=disk%7CaWQ9MzU2Jl89TEZ6d3JtUDdUdVg0dXJ3Q2pZYTExTlhPTmh1czI3V1k%3D%7CImRvd25sb2FkfGRpc2t8YVdROU16VTJKbDg5VEVaNmQzSnRVRGRVZFZnMGRYSjNRMnBaWVRFeFRsaFBUbWgxY3pJM1Yxaz18MGE5ZDcyNjYwMDZlOWYwNjAwNmIxMmU0MDAwMDAwMDEwMDAwMDcwMmFhYWUwYzBlOTkxNTM0NjZkMTY1ZWNmYTRhOTJjZSI%3D.ng9IaX1mYX7R%2B4yWP67P6j9%2BWvh78aG47IO0Ex6UVQ8%3D",
 "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/26417397-8431-4343-9c0f-a40d4a2831c8.jpg"
 },
 "time": {
 "start": 1718783929.8197,
 "finish": 1718783930.09911,
 "duration": 0.279407024383545,
 "processing": 0.227760076522827,
 "date_start": "2024-06-19T07:58:49+00:00",
 "date_finish": "2024-06-19T07:58:50+00:00",
 "operating_reset_at": 1718784529,
 "operating": 0.227726936340332
 }
}

```
