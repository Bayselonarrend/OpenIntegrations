---
sidebar_position: 5
---

# Upload file by URL
 Uploads a file to the cloud drive by fetching it from the specified URL



`Function UploadFileByURL(Val Token, Val FileURL, Val Path) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FileURL | --url | String | URL source of the file |
 | Path | --path | String | Save path on Dropbox |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Path = "/New/url_doc.docx";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 URL = "https://openintegrations.dev/test_data/document.docx";
 
 Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);
```
	


```sh title="CLI command example"
 
 oint dropbox UploadFileByURL --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --url %url% --path %path%

```

```json title="Result"
{
 ".tag": "async_job_id",
 "async_job_id": "41d0vPCn2mYAAAAAAAAAAQ"
}
```
