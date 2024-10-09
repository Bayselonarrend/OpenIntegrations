---
sidebar_position: 1
---

# Open dialog
 Opens a new dialog with one or more users



`Function OpenDialog(Val Token, Val ArrayOfUsers) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ArrayOfUsers | --users | Array of String | User ID Array |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token = "xoxb-6965308400114-696804637...";
    User  = "U06UABH3APP";

    Result = OPI_Slack.OpenDialog(Token, User);
```



```sh title="CLI command example"
    
  oint slack OpenDialog --token %token% --users %users%

```

```json title="Result"
{
 "ok": true,
 "no_op": false,
 "already_open": false,
 "channel": {
  "id": "D06UAKK1C6R"
 }
}
```
