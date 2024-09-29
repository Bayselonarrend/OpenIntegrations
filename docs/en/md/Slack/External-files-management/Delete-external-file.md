---
sidebar_position: 5
---

# Delete external file
 Deletes an external file from Slack



`Function DeleteExternalFile(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "";

    Result = OPI_Slack.DeleteExternalFile(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack DeleteExternalFile --token %token% --fileid "F070P52CU94"

```

```json title="Result"
{
  "ok": true
  }
```
