---
sidebar_position: 7
---

# Download file
 Downloads a file at the specified path



`Function DownloadFile(Val Token, Val Path, Val SavePath = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the file for downloading |
  | SavePath | --out | String | File save path |

  
  Returns:  BinaryData,String - Binary data or file path when SavePath parameter is specified

<br/>




```bsl title="Code example"
    Token = "y0_AgAAAABdylaOAAs0QgAAAAD5i-a...";
    Path  = "/3971b158-4a89-4050-8150-1497befa9c9b.png";

    Result = OPI_YandexDisk.DownloadFile(Token, Path);
```
 



```json title="Result"
NOT JSON: FF D8 FF E1 54 C1 45 78 69 66 00 00 49 49 2A 00 08 00 00 00 0B 00 0E 01 02 00 20 00 00 00 92 00 00 00 0F 01 02 00 05 00 00 00 B2 00 00 00 10 01 02 00 07 00 00 00 B8 00 00 00 12 01 03 00 01 00…
```
