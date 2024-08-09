---
sidebar_position: 2
---

# Get list of folder files
 Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified



`Function GetListOfFolderFiles(Val Token, Val Path = "", Val Detailed = False, Val Cursor = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the directory. Optional if the cursor is specified |
 | Detailed | --detail | Boolean | Add information fields for mediafiles |
 | Cursor | --cursor | String | Cursor from the previous request to get the next set of files |

 
 Returns: HTTPResponse - Get list of folder files

<br/>




```bsl title="Code example"
 Path = "/New";
 Token = "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ...";
 
 Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);
```
	


```sh title="CLI command example"
 
 oint dropbox GetListOfFolderFiles --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --detail %detail% --cursor %cursor%

```

```json title="Result"
{
 "entries": [
 {
 ".tag": "file",
 "name": "Dogs.mp3",
 "path_lower": "/new/dogs.mp3",
 "path_display": "/New/Dogs.mp3",
 "id": "id:kJU6-a-pT48AAAAAAAAACA",
 "client_modified": "2024-05-15T16:58:30Z",
 "server_modified": "2024-06-09T13:12:45Z",
 "rev": "61a74c9e3b3f3bd841553",
 "size": 9229352,
 "is_downloadable": true,
 "content_hash": "376f728ef041d9cef08406f16debc12de89d83130e69c66a817fd834d2d82dc2"
 },
 {
 ".tag": "file",
 "name": "mydoc.docx",
 "path_lower": "/new/mydoc.docx",
 "path_display": "/New/mydoc.docx",
 "id": "id:kJU6-a-pT48AAAAAAAAABw",
 "client_modified": "2024-05-14T16:49:41Z",
 "server_modified": "2024-06-09T13:12:45Z",
 "rev": "61a74c9e3b3f4bd841553",
 "size": 24069,
 "is_downloadable": true,
 "content_hash": "8d63c5989ceec1a90f3fde2ffaa76efcd2c050191e6b55a1761e4e352590bd8c"
 }
 ],
 "cursor": "AAEXfuMhG6Xl2ENYH4uAoLS_nOUV4SC7ChaMxK4ZIphj9x5INumYZrHv6jqph4fgkOy6PpFTTaaJ4BTjzVGZnTk7tB5wCCp1Eogn8gCW-Agz-ej4X6ir5p-KX63vBgDV0OZ-boy78oUXMJeOtU9sjEij34BoqBCtWYOFje4PXhEV3KwVySRWzPlXSEq9arMo1AaP8PFuDxx6JTxSGRdcQwnc",
 "has_more": false
}
```
