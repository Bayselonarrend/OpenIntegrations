---
sidebar_position: 5
---

# Get external link for a file
 Get external link to file



`Function GetFileExternalLink(Val URL, Val FileID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | File identifier |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.getExternalLink](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_getexternallink.php)
:::
<br/>


```bsl title="Code example"
    URL    = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
    FileID = "5010";

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "fe3fa966006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFileExternalLink --url "b24-ar17wx.bitrix24.by" --fileid "5010" --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
  "result": "https://b24-ar17wx.bitrix24.by/~pT3DD",
  "time": {
  "start": 1720017752.7023,
  "finish": 1720017752.74417,
  "duration": 0.0418639183044434,
  "processing": 0.00636386871337891,
  "date_start": "2024-07-03T14:42:32+00:00",
  "date_finish": "2024-07-03T14:42:32+00:00",
  "operating_reset_at": 1720018352,
  "operating": 0
  }
  }
```
