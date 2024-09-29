---
sidebar_position: 5
---

# Create folder
 Creates an empty directory on the drive



`Function CreateFolder(Val Token, Val Name, Val Parent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Name | --title | String | Folder name |
  | Parent | --catalog | String | Parent |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token     = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Directory = "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy";
    Name      = "TestFolder";

    Result = OPI_GoogleDrive.CreateFolder(Token, Name, Directory);
```



```sh title="CLI command example"
    
  oint gdrive CreateFolder --token %token% --title "TestFolder" --catalog %catalog%

```

```json title="Result"

```
