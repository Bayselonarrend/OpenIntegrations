---
sidebar_position: 4
---

# Delete file
 Deletes a file on Slack



`Function DeleteFile(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
  
  FileID = "F070VL6FQFM";
  
  Response = OPI_Slack.DeleteFile(Token, FileID); //Map
  Response = OPI_Tools.JSONString(Response);//JSON string
```



```sh title="CLI command example"
    
  oint slack DeleteFile --token %token% --fileid "F070VL6FQFM"

```

```json title="Result"
{
  "ok": true
  }
```
