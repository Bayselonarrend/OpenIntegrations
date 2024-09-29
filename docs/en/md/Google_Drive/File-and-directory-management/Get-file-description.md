---
sidebar_position: 10
---

# Get file description 




`Function GetFileDescription() Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|

  
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
