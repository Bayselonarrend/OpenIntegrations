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

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07RFHJL5T8";

    Result = OPI_Slack.DeleteFile(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack DeleteFile --token %token% --fileid "F070VL6FQFM"

```

```json title="Result"
{
 "ok": true
}
```
