---
sidebar_position: 5
---

# Make file public
 Creates a public URL for the file. Requires user token



`Function MakeFilePublic(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | User token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07QLU2LLTW";

    Result = OPI_Slack.MakeFilePublic(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack MakeFilePublic --token %token% --fileid %fileid%

```

```json title="Result"

```
