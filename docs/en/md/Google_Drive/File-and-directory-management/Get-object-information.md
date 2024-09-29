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
    Token      = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Identifier = "191iyaa6-2BCNRPOF0F8mQ0TuNWPNesdM";

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive GetObjectInformation --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```

```json title="Result"

```
