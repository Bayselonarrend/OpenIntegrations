---
sidebar_position: 10
---

# Get file description
 Gets a blank description template for uploading a file



`Function GetFileDescription(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Map Of KeyAndValue - File description

<br/>




```bsl title="Code example"
    Result = OPI_GoogleDrive.GetFileDescription();
```



```sh title="CLI command example"
    
  oint gdrive GetFileDescription

```

```json title="Result"
{
 "MIME": "image/jpeg",
 "Name": "New file.jpg",
 "Description": "This is a new file",
 "Parent": "root"
}
```
