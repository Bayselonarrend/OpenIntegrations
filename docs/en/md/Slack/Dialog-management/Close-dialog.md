﻿---
sidebar_position: 2
---

# Close dialog
 Closes an existing dialog



`Function CloseDialog(Val Token, Val Dialog) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Dialog | --conv | String | Dialog ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    Dialog = "D06UAKK1C6R";

    Result = OPI_Slack.CloseDialog(Token, Dialog);
```



```sh title="CLI command example"
    
  oint slack CloseDialog --token %token% --conv "D06UAKK1C6R"

```

```json title="Result"
{
 "ok": true,
 "already_closed": false,
 "no_op": false
}
```
