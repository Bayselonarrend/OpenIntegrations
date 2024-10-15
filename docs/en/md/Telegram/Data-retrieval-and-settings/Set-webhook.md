---
sidebar_position: 3
---

# Set Webhook
 Set webhook URL for bot event handling in webhook mode



`Function SetWebhook(Val Token, Val URL) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | URL | --url | String | Request handling address from Telegram (with https:) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [setWebhook](https://core.telegram.org/bots/api#setwebhook)
:::
<br/>


```bsl title="Code example"
    Token = "6129457865:AAFyzNYOAFbu...";
    URL   = "https://api.athenaeum.digital/opi/hs/twitter";

    Result = OPI_Telegram.SetWebhook(Token, URL);
```
 



```json title="Result"
{
 "ok": true,
 "result": true,
 "description": "Webhook was set"
}
```
