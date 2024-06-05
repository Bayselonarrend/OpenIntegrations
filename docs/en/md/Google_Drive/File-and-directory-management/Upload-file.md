---
sidebar_position: 4
---

# Upload file
 Uploads a file to the drive


*Function UploadFile(Val Token, Val File, Val Description) ExportReturn FileManagement(Token, File, Description);EndFunction*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | File | --file | BinaryData,String | File to be uploaded |
 | Description | --props | Key-Value Pair | JSON description or path to .json |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Description = New Map;
 Description.Insert("MIME", "image/jpeg");
 Description.Insert("Name", "New file.jpg");
 Description.Insert("Description", "This is a new file");
 Description.Insert("Parent", "root");
 
 Image = "C:\OPI\image.jpg";
 
 Response = OPI_GoogleDrive.UploadFile(Token, Image, Description); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
 
	
```

```sh title="CLI command example"
 
 oint gdrive UploadFile --token %token% --file %file% --props %props%


```


```json title="Result"

{
 "mimeType": "image/jpeg",
 "name": "New file.jpg",
 "id": "16hPGNTMmbnXhz_g0vjGbrLP19h56RwIg",
 "kind": "drive#file"
 }

```
