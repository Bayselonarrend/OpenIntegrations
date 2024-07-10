---
sidebar_position: 7
---

# Download file
 Downloads a file at the specified path


<br/>


`Function DownloadFile(Val Token, Val Path, Val SavePath = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the file for downloading |
 | SavePath | --out | String | File save path |

 
 Returns: BinaryData,String - Binary data or file path when SavePath parameter is specified

<br/>




```bsl title="Code example"
 Path = "/alpaca.png";
 Result = OPI_YandexDisk.DownloadFile(Token, Path);
```
	


```sh title="CLI command example"
 
 oint yadisk DownloadFile --token %token% --path %path% --out %out%

```

```json title="Result"
<Binary file's binary data>
```
