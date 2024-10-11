---
sidebar_position: 4
---

# Delete webhook
 Deletes the bot event handler URL for webhook operation



`Function DeleteWebhook(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [deleteWebhook](https://core.telegram.org/bots/api#deletewebhook)
:::
<br/>


```bsl title="Code example"
    Token  = "6129457865:AAFyzNYOAFbu...";
    Result = OPI_Telegram.DeleteWebhook(Token);
```



```sh title="CLI command example"
    
  oint telegram DeleteWebhook --token "6129457865:AAFyzNYOAFbu..."

```

```json title="Result"
{
 "ok": true,
 "result": true,
 "description": "Webhook was deleted"
}
```
