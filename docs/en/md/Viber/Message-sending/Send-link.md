---
sidebar_position: 6
---

# Send link
 Sends a URL with a preview to a chat or channel


*Function SendLink(Val Token, Val URL, Val UserID, Val SendingToChannel) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | URL | --url | String | SentLink |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Viber

```bsl title="Code example"
	
 
 BotToken = "523b5b25ed27e6ec-111111111111111-2222222222222222";
 UserID = "d3jxe1111111111jYGgZg==";
 
 Response = OPI_Viber.SendLink(BotToken, "https://github.com/Bayselonarrend", UserID, False); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
	
```

```sh title="CLI command example"
 
 oint viber SendLink --token %token% --url %url% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel%

```


```json title="Result"

{
 "billing_status": 1,
 "chat_hostname": "SN-CHAT-15_",
 "message_token": 5925752472607291800,
 "status_message": "ok",
 "status": 0
 }

```
