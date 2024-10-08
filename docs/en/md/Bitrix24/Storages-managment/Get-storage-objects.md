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
   "ID": "12394",
   "NAME": "Picture2.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8544",
   "SIZE": "2114023",
   "CREATE_TIME": "2024-10-07T22:25:15+03:00",
   "UPDATE_TIME": "2024-10-07T22:25:15+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTQmXz1GUzRMbVRlaU1DdGNYY0pnbEZrbERCRFE3cTdLdG1kbQ%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFFtWHoxR1V6Uk1iVlJsYVUxRGRHTllZMHBuYkVacmJFUkNSRkUzY1RkTGRHMWtiUT09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.khOrm6k0W6LiXtAfHD8qeb57rrxVm86n6NTE969X2Bw%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture2.jpg"
  },
  {
   "ID": "12396",
   "NAME": "Picture1.jpg",
   "CODE": null,
   "STORAGE_ID": "3",
   "TYPE": "file",
   "PARENT_ID": "3",
   "DELETED_TYPE": "0",
   "GLOBAL_CONTENT_VERSION": "1",
   "FILE_ID": "8546",
   "SIZE": "805189",
   "CREATE_TIME": "2024-10-07T22:25:16+03:00",
   "UPDATE_TIME": "2024-10-07T22:25:16+03:00",
   "DELETE_TIME": null,
   "CREATED_BY": "1",
   "UPDATED_BY": "1",
   "DELETED_BY": "0",
   "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz1Gdnl1VGFtOGJ4SkNBZFJGd3FheDNMNFJkUjhQa0RlbA%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxR2RubDFWR0Z0T0dKNFNrTkJaRkpHZDNGaGVETk1ORkprVWpoUWEwUmxiQT09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.%2FNsRnX4K%2FqxB5otZ2lMHdy8ajG6vgO0nXMqSzO4SoTc%3D",
   "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
  }
 ],
 "total": 2,
 "time": {
  "start": 1728329116.34537,
  "finish": 1728329116.37895,
  "duration": 0.0335819721221924,
  "processing": 0.00615692138671875,
  "date_start": "2024-10-07T22:25:16+03:00",
  "date_finish": "2024-10-07T22:25:16+03:00",
  "operating_reset_at": 1728329716,
  "operating": 0
 }
}
```
