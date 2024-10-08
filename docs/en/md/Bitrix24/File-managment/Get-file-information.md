---
sidebar_position: 3
---

# Get information about file
 Get information about file by ID



`Function GetFileInformation(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.get](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_get.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    FileID = "10836";

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFileInformation --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": {
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
  "DOWNLOAD_URL": "https://b24-ar17wx.bitrix24.by/rest/download.json?auth=7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d&token=disk%7CaWQ9MTIzOTYmXz1DNkJKSm9VTVczS0cxTGQybWZTbEFtNUNBVXQ1MTdkYw%3D%3D%7CImRvd25sb2FkfGRpc2t8YVdROU1USXpPVFltWHoxRE5rSktTbTlWVFZjelMwY3hUR1F5YldaVGJFRnROVU5CVlhRMU1UZGtZdz09fDdjNDMwNDY3MDA2ZTlmMDYwMDZiMTJlNDAwMDAwMDAxMDAwMDA3MTEwM2YxYzQ2OWUzMTRmOTY3ZmY5ZjRmZDlkZGJiNGQi.Xn5G2DpT85r3hnn1DrY7DcYIiII7o6XqXVetHaJt1ys%3D",
  "DETAIL_URL": "https://b24-ar17wx.bitrix24.by/docs/file/Picture1.jpg"
 },
 "time": {
  "start": 1728329116.50668,
  "finish": 1728329116.53745,
  "duration": 0.0307731628417969,
  "processing": 0.00538301467895508,
  "date_start": "2024-10-07T22:25:16+03:00",
  "date_finish": "2024-10-07T22:25:16+03:00",
  "operating_reset_at": 1728329716,
  "operating": 0
 }
}
```
