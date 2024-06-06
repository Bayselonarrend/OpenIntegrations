---
sidebar_position: 1
---

# Get bot information
 Gets basic information about the bot


*Function GetBotInformation(Val Token) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack 

```bsl title="Code example"
	
 
 
 Response = OPI_Slack.GetBotInformation(Token); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
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
