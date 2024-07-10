---
sidebar_position: 3
---

# Set Webhook
 Set webhook URL for bot event handling in webhook mode



`Function SetWebhook(Val Token, Val URL) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | URL | --url | String | Request handling address from Telegram (with https:) |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
 Token = "6129457865:AAFyzNYOAFbu...";
 URL = "https://api.athenaeum.digital/opi/hs/twitter";
 
 Result = OPI_Telegram.SetWebhook(Token, URL);
```
	


```sh title="CLI command example"
 
 oint telegram SetWebhook --token "6129457865:AAFyzNYOAFbu..." --url "https://api.athenaeum.digital/opi/hs/twitter"

```

```json title="Result"
{
 "ok": true,
 "result": true,
 "description": "Webhook was set"
}
```
