---
sidebar_position: 12
---

# Download folder
 Downloads a zip archive with the contents of the specified directory


<br/>


`Function DownloadFolder(Val Token, Val Path) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path or ID of the directory |

 
 Returns: BinaryData - binary data of the zip archive with the contents of the directory

<br/>




```bsl title="Code example"
Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New";
 
 Result = OPI_Dropbox.DownloadFolder(Token, Path);
```
	


```sh title="CLI command example"
 
 oint dropbox DownloadFolder --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%

```

```json title="Result"
NOT JSON: 50 4B 03 04 14 00 00 08 00 00 36 3D BE 58 00 00 00 00 00 00 00 00 00 00 00 00 04 00 09 00 4E 65 77 2F 55 54 05 00 01 B9 2D 58 66 50 4B 03 04 14 00 08 08 00 00 4F 87 AF 58 00 00 00 00 00 00 00…
```
