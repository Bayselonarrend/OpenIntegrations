---
sidebar_position: 3
---

# Get list of files
 Gets the list of files



`Function GetFilesList(Val Token, Val NameContains = "", Val Directory = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | NameContains | --querry | String | Filter by name |
  | Directory | --catalog | String | Filter by parent directory ID |

  
  Returns:  Map Of KeyAndValue - Array of file mappings

<br/>




```bsl title="Code example"
  
  Directory = "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4";
  Response = OPI_GoogleDrive.GetFilesList(Token,, Directory); //Map
  Response = OPI_Tools.JSONString(Response); //String
```



```sh title="CLI command example"
    
  oint gdrive GetFilesList --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Result"

```
