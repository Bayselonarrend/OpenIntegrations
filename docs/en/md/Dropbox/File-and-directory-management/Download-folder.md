---
sidebar_position: 12
---

# Download folder
 Downloads a zip archive with the contents of the specified directory



`Function DownloadFolder(Val Token, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path or ID of the directory |

  
  Returns:  BinaryData - binary data of the zip archive with the contents of the directory

<br/>




```bsl title="Code example"
    Token = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);
```
 



```json title="Result"
NOT JSON: 50 4B 03 04 14 00 00 08 00 00 78 94 48 59 00 00 00 00 00 00 00 00 00 00 00 00 04 00 09 00 4E 65 77 2F 55 54 05 00 01 84 7B 05 67 50 4B 03 04 14 00 08 08 00 00 4F 87 AF 58 00 00 00 00 00 00 00…
```
