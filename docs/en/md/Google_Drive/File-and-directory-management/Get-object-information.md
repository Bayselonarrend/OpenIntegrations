---
sidebar_position: 1
---

# Get object information
 Gets information about a folder or file by ID



`Function GetObjectInformation(Val Token, Val Identifier) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | Identifier of the file or folder |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Identifier = "1Q3vl7hcmdeJvd86jC84pdGKW5772apUy";

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetObjectInformation --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"

```
