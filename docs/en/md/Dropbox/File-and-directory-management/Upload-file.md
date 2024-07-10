---
sidebar_position: 4
---

# Upload file
 Uploads a file to the cloud drive


<br/>


`Function UploadFile(Val Token, Val File, Val Path, Val Overwrite = False) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | File | --file | String, BinaryData | Data file for upload |
 | Path | --path | String | Save path on Dropbox |
 | Overwrite | --overwrite | Boolean | Overwrite file in case of path conflicts |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox 

<br/>




```bsl title="Code example"
 Path = "/New/pic.png";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Image = "https://openintegrations.dev/test_data/picture.jpg";
 
 ImagePath = GetTempFileName("png");
 FileCopy(Image, ImagePath);
 
 Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);
```
	


```sh title="CLI command example"
 
 oint dropbox UploadFile --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --file %file% --path %path% --overwrite %overwrite%

```

```json title="Result"
 {
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAABYA",
 "client_modified": "2024-05-30T12:32:09Z",
 "server_modified": "2024-05-30T12:32:09Z",
 "rev": "619ab0e44a57cbd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
}
```
