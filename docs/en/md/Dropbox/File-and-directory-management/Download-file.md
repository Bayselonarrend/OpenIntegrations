---
sidebar_position: 11
---

# Download file
 Downloads a file by the specified path or ID


*Function DownloadFile(Val Token, Val Path) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path or ID of the file |

 
 Returns: BinaryData - binary data of the file

```bsl title="Code example"
	
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New/pic.png";
 
 Result = OPI_Dropbox.DownloadFile(Token, Path);
	
```

```sh title="CLI command example"
 
 oint dropbox DownloadFile --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%


```


```json title="Result"

NOT JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…

```
