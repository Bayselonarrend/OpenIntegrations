---
sidebar_position: 5
---

# Create folder
 Creates an empty directory on the drive




<br/>


*Function CreateFolder(Val Token, Val Name, Val Parent = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Name | --title | String | Folder name |
 | Parent | --catalog | String | Parent |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google


```bsl title="Code example"
 
 Name = "TestFolder";
 
 Response = OPI_GoogleDrive.CreateFolder(Token, Name); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint gdrive CreateFolder --token %token% --title "TestFolder" --catalog %catalog%

```

```json title="Result"
 {
 "mimeType": "application/vnd.google-apps.folder",
 "name": "TestFolder",
 "id": "1fIqr5pJV3QybT5sPeZhBD_0TIvtL5Ovc",
 "kind": "drive#file"
 }
```
