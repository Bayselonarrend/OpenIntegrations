---
sidebar_position: 2
---

# Send image
 Sends an image to a chat or channel



`Function SendImage(Val Token, Val URL, Val UserID, Val SendingToChannel, Val Description = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | URL | --picture | String | Image URL |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | boolean | Sending to channel or bot chat |
 | Description | --description | String | Image annotation |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
 
 ChannelToken = "523b58ba82afffaa-111111111111111-2222222222222222";
 UserID = "tMNGh111111111D+bT4g==";
 
 Response = OPI_Viber.SendImage(ChannelToken, "https://api.athenaeum.digital/logo.png", UserID, True, "Alpaca"); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint viber SendImage --token %token% --picture %picture% --user "tMNGh111111111D+bT4g" --ischannel %ischannel% --description %description%

```

```json title="Result"
{
 "chat_hostname": "SN-CHAT-12_",
 "message_token": 5925484936191962157,
 "status_message": "ok",
 "status": 0
 }
```
