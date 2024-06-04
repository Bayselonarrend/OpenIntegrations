---
sidebar_position: 1
---

# Set Webhook
IMPORTANT: Setting up Webhook is mandatory according to Viber rules. You need to have a free URL for this., which will return 200 and a genuine SSL certificate. If there is a certificate and the database is published on the server - you can use an HTTP service. Information about new messages will also be sent there Viber periodically knocks on the Webhook address, so if it is inactive, everything will stop working


*Function SetWebhook(Val Token, Val URL) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Viber Token |
 | URL | --url | String | URL for setting up Webhook |

 
 Returns: Key-Value Pair - serialized JSON response from Viber

```bsl title="Code example"
	
 
 Response = OPI_Viber.SetWebhook(Token, "https://api.athenaeum.digital/opi/hs/viber"); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint viber SetWebhook --token %token% --url %url%

```


```json title="Result"

{
 "event_types": [
 "subscribed",
 "unsubscribed",
 "webhook",
 "conversation_started",
 "client_status",
 "action",
 "delivered",
 "failed",
 "message",
 "seen"
 ],
 "chat_hostname": "SN-CHAT-12_",
 "status_message": "ok",
 "status": 0
 }

```
