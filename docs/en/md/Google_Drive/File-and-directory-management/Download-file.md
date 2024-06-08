---
sidebar_position: 6
---

# Download file
 Gets file by ID


*Function DownloadFile(Val Token, Val Identifier, Val SavePath = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Identifier | --object | String | File identifier |
 | SavePath | --out | String | File save path |

 
 Returns: BinaryData,String - Binary data or file path when SavePath parameter is specified

```bsl title="Code example"
	
 
 Identifier = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa";
 
 Response = OPI_GoogleDrive.DownloadFile(Token, Identifier); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
	
```

```sh title="CLI command example"
 
 oint gdrive DownloadFile --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa" --out %out%


```


```json title="Result"

<Binary file's binary data>

```
