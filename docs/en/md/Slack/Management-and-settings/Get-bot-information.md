﻿---
sidebar_position: 1
---

# Get bot information
 Gets basic information about the bot



`Function GetBotInformation(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    Result = OPI_Slack.GetBotInformation(Token);
```



```sh title="CLI command example"
    
  oint slack GetBotInformation --token %token%

```

```json title="Result"
{
 "ok": true,
 "url": "https://openintegrationsgroup.slack.com/",
 "team": "OpenIntegrations",
 "user": "openintegrations",
 "team_id": "T06UD92BS3C",
 "user_id": "U06UG1CAYH2",
 "bot_id": "B06TZ0MJV5M",
 "is_enterprise_install": false
}
```
