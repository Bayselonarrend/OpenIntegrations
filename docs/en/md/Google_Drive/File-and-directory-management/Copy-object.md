---
sidebar_position: 7
---

# Copy object
 Copies file or directory


*Function CopyObject(Val Token, Val Identifier, Val NewName = "", Val NewParent = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Identifier | --object | String | Object identifier |
 | NewName | --title | String | New object name |
 | NewParent | --catalog | String | New parent directory |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 NewName = "CopiedFile.jpeg";
 NewLocation = "1603PU_Hrkvj4HeFJKYSVxZJDRoGvd3SJ";
 Identifier = "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk";
 
 Response = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewLocation) //Map
 Response = OPI_Tools.JSONString(Response); //String
 

	
```

```sh title="CLI command example"
 
 oint gdrive CopyObject --token %token% --object "1F8pfXPgltiOG2fPv88uStwegYj1tRoFk" --title "CopiedFile.jpeg" --catalog %catalog%


```


```json title="Result"

{
 "mimeType": "image/jpeg",
 "name": "CopiedFile.jpeg",
 "id": "1uxsMaxL1W5Y7z6-HhjE6QpyDxFPgW4Fy",
 "kind": "drive#file"
 }

```
