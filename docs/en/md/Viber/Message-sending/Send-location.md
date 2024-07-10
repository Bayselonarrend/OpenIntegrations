---
sidebar_position: 5
---

# Send location
 Sends geographic coordinates to a chat or channel


<br/>


`Function SendLocation(Val Token, Val Latitude, Val Longitude, Val UserID, Val SendingToChannel) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Latitude | --lat | String, Number | Geographic latitude |
 | Longitude | --long | String, Number | Geographic longitude |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
 
 BotToken = "523b5b25ed27e6ec-111111111111111-2222222222222222";
 UserID = "d3jxe1111111111jYGgZg==";
 
 Response = OPI_Viber.SendLocation(BotToken, "55.75", "37.6167", UserID, False); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint viber SendLocation --token %token% --lat %lat% --long %long% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel%

```

```json title="Result"
 {
 "billing_status": 1,
 "chat_hostname": "SN-CHAT-10_",
 "message_token": 5925751017338988046,
 "status_message": "ok",
 "status": 0
 }
```
