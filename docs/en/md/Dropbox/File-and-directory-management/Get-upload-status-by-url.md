---
sidebar_position: 6
---

# Get upload status by URL
 Gets the upload status of the file by URL


<br/>


`Function GetUploadStatusByURL(Val Token, Val JobID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | JobID | --job | String | ID of async jsob from UploadFileByURL response |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 WorkID = "G8YbueOu2nsAAAAAAAAAAQ";
 Status = "in_progress";
 
 WHile Status = "in_progress" Do
 
 Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
 Status = Result[".tag"];
 
 OPI_Tools.Pause(5);
 
 
 EndDo;
```
	


```sh title="CLI command example"
 
 oint dropbox GetUploadStatusByURL --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --job %job%

```

```json title="Result"
{
 ".tag": "complete",
 "name": "url_doc.docx",
 "path_lower": "/new/url_doc.docx",
 "path_display": "/New/url_doc.docx",
 "id": "id:kJU6-a-pT48AAAAAAAABYw",
 "client_modified": "2024-05-30T12:33:07Z",
 "server_modified": "2024-05-30T12:33:08Z",
 "rev": "619ab11c37fb9bd841553",
 "size": 24069,
 "is_downloadable": true,
 "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
}
```
