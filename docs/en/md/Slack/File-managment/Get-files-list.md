---
sidebar_position: 1
---

# Get list of files
 Gets a list of files of the bot or channel



`Function GetFilesList(Val Token, Val Channel = "", Val PageNumber = 1) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel for selection |
  | PageNumber | --page | Number, String | Page number |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";

    Result = OPI_Slack.GetFilesList(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack GetFilesList --token %token% --channel "C123456" --page "1"

```

```json title="Result"
{
 "ok": true,
 "files": [],
 "paging": {
  "count": 100,
  "total": 12,
  "page": 1,
  "pages": 1
 }
}
```
