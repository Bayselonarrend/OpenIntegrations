---
sidebar_position: 2
---

# Get list of directories
 Gets the list of drive directories



`Function GetDirectoriesList(Val Token, Val NameContains = "", Val Detailed = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | NameContains | --querry | String | Filter by name |
  | Detailed | --depth | Boolean | Adds a list of files to the directory fields |

  
  Returns:  Map Of KeyAndValue - Array of directory mappings

<br/>




```bsl title="Code example"
    Name  = "TestFolder";
    Token = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";

    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);
```



```sh title="CLI command example"
    
  oint gdrive GetDirectoriesList --token %token% --querry %querry% --depth %depth%

```

```json title="Result"

```
