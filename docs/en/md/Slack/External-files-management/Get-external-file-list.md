---
sidebar_position: 1
---

# Get list of external files
 Gets a list of external files of a user or channel



`Function GetExternalFileList(Val Token, Val Channel = "", Val Cursor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel for selection |
  | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";

    Result = OPI_Slack.GetExternalFileList(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack GetExternalFileList --token %token% --channel "C070VPMKN8J" --cursor %cursor%

```

```json title="Result"
{
 "ok": true,
 "files": [],
 "response_metadata": {
  "next_cursor": ""
 }
}
```
