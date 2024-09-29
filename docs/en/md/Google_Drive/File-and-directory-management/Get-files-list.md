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
    Token        = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Directory    = "root";
    NameContains = "data";

    Result = OPI_GoogleDrive.GetFilesList(Token, NameContains, Directory);
```



```sh title="CLI command example"
    
  oint gdrive GetFilesList --token %token% --querry %querry% --catalog "1VWoLK5w0uPVSjK3oyIXeiMtINN4jDOz4"

```

```json title="Result"

```
