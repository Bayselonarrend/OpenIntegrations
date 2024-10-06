---
sidebar_position: 5
---

# Get a list of child storage objects
 Get a list of files and folders, located at the root of the storage



`Function GetStorageObjects(Val URL, Val StorageID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | StorageID | --storageid | String, Number | Storage ID |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.storage.getchildren](https://dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getchildren.php)
:::
<br/>


```bsl title="Code example"
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetStorageObjects --url "b24-ar17wx.bitrix24.by" --storageid "3" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": [
  {
   "ID": "12094",
   "NAME": "Picture2.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8344",
   "SIZE": "2114023",
   "CREATE_TIME": "2024-10-05T18:05:41+03:00",
   "UPDATE_TIME": "2024-10-05T18:05:41+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTQmXz1McnFBc3ppdk5wZGU1ODByeGNKNXVHSlYyQUNkR2Z1QQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFFtWHoxTWNuRkJjM3BwZGs1d1pHVTFPREJ5ZUdOS05YVkhTbFl5UVVOa1IyWjFRUT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.podhp7%2FPEbP5bja4X5lrYg0Y3XGNtEQ3wvKe%2FJVKMPo%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture2.jpg"
  },
  {
   "ID": "12096",
   "NAME": "Picture1.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8346",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-05T18:05:43+03:00",
   "UPDATE_TIME": "2024-10-05T18:05:43+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=a7630167006e9f06006b12e400000001000007e2e201aeb9fedba2013080af5a95c05e&token=disk%7CaWQ9MTIwOTYmXz1BQ0x5TXN0RWltUjd3WFBFWjdtbkxnMWNIZUlEUkk4UA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXdPVFltWHoxQlEweDVUWE4wUldsdFVqZDNXRkJGV2pkdGJreG5NV05JWlVsRVVrazRVQT09fGE3NjMwMTY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3ZTJlMjAxYWViOWZlZGJhMjAxMzA4MGFmNWE5NWMwNWUi.rfCzVTe6b%2BS0gmNGQOTr2x5pa1rX%2FUHZzpDkR9dwhvo%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
  }
 ],
 "total": 2,
 "time": {
  "start": 1728140743.2696,
  "finish": 1728140743.3079,
  "duration": 0.0382990837097168,
  "processing": 0.00704717636108398,
  "date_start": "2024-10-05T18:05:43+03:00",
  "date_finish": "2024-10-05T18:05:43+03:00",
  "operating_reset_at": 1728141343,
  "operating": 0
 }
}
```
