---
sidebar_position: 6
---

# Make file private
 Removes the public URL from the file. Requires user token



`Function MakeFilePrivate(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | User token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07PK2C447M";

    Result = OPI_Slack.MakeFilePrivate(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack MakeFilePrivate --token %token% --fileid %fileid%

```

```json title="Result"

```
