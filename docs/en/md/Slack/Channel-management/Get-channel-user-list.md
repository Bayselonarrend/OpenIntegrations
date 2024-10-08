﻿---
sidebar_position: 2
---

# Get channel user list
 Gets a list of users in the specified channel



`Function GetChannelUserList(Val Token, Val Channel, Val Cursor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PK52ES3U";

    Result = OPI_Slack.GetChannelUserList(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack GetChannelUserList --token %token% --channel "C070VPMKN8J" --cursor %cursor%

```

```json title="Result"
{
 "ok": true,
 "members": [
  "U06UG1CAYH2"
 ],
 "response_metadata": {
  "next_cursor": ""
 }
}
```
