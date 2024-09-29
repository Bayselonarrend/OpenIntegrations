---
sidebar_position: 8
---

# Kick user from channel
 Removes specified user from channel



`Function KickUserFromChannel(Val Token, Val Channel, Val User) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | User | --user | String | User ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PXKKH2G1";
    User    = "U06UABH3APP";

    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);
```



```sh title="CLI command example"
    
  oint slack KickUserFromChannel --token %token% --channel "C070VPMKN8J" --user "U06UG1CAYH2"

```

```json title="Result"
{
  "ok": true
  }
```
