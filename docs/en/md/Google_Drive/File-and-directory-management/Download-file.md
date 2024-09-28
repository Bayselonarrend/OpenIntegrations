---
sidebar_position: 6
---

# Download file
 Gets file by ID



`Function DownloadFile(Val Token, Val Identifier, Val SavePath = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Identifier | --object | String | File identifier |
  | SavePath | --out | String | File save path |

  
  Returns:  BinaryData,String - Binary data or file path when SavePath parameter is specified

<br/>




```bsl title="Code example"
    Token      = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Identifier = "1RijXw14hyQN_59ZOzJ9f35ezzU_qd114";

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);
```



```sh title="CLI command example"
    
  oint gdrive DownloadFile --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa" --out %out%

```

```json title="Result"
<Binary file's binary data>
```
