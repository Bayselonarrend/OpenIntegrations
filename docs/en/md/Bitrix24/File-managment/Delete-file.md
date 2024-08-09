---
sidebar_position: 4
---

# Delete file
 Delete file by ID



`Function DeleteFile(Val URL, Val FileID, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | FileID | --fileid | String, Number | ID of removing file |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.delete](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_delete.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
 FileID = "5008";
 
 Result = OPI_Bitrix24.DeleteFile(URL, FileID);
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "fe3fa966006e9f06006b12e400000001000...";
 FileID = "5010";
 
 Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 DeleteFile --url "b24-ar17wx.bitrix24.by" --fileid "478" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1718783933.86753,
 "finish": 1718783937.64223,
 "duration": 3.77469992637634,
 "processing": 3.73617887496948,
 "date_start": "2024-06-19T07:58:53+00:00",
 "date_finish": "2024-06-19T07:58:57+00:00",
 "operating_reset_at": 1718784533,
 "operating": 3.73615193367004
 }
}
```
