---
sidebar_position: 10
---

# Upload file
 Uploads a file to disk at the specified path


*Function UploadFile(Val Token, Val Path, Val File, Val Overwrite = False) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path for saving the file to disk |
 | File | --file | String, BinaryData | File for upload |
 | Overwrite | --rewrite | Boolean | Overwrite if a file with the same name already exists |

 
 Returns: Key-Value Pair - serialized JSON response from Yandex 

```bsl title="Code example"
	
 
 Token = "y0_AgAAAABdylaOAA...";
 Path = "/AlpacaInFile.png";
 File = "C:\logo.png";
 
 Response = OPI_YandexDisk.UploadFile(Token, Path, File); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint yadisk UploadFile --token "y0_AgAAAABdylaOAA..." --path "/AlpacaInFile.png" --file "C:\logo.png" --rewrite %rewrite%


```


```json title="Result"

<empty string>

```
