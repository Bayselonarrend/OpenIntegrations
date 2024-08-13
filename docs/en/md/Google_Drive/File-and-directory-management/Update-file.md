---
sidebar_position: 8
---

# Update file
 Updates file binary data



`Function UpdateFile(Val Token, Val Identifier, Val File, Val NewName = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the object to update |
  | File | --file | BinaryData,String | File source for update |
  | NewName | --title | String | New file name (if necessary) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
  
  NewName = "Updated file.jpeg";
  ReplacementImage = "C:\OPI\image2.jpg";
  Identifier = "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ";
  
  Response = OPI_GoogleDrive.UpdateFile(Token, Identifier, ReplacementImage, NewName) //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint gdrive UpdateFile --token %token% --object "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ" --file %file% --title %title%

```

```json title="Result"
{
  "mimeType": "image/jpeg",
  "name": "UpdatedFile.jpg",
  "id": "1V0oaZh3qQZ7-wbARC8-vrErAFllsBGSJ",
  "kind": "drive#file"
  }
```
