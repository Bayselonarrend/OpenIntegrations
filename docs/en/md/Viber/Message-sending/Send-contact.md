---
sidebar_position: 4
---

# Send contact
 Sends a contact with a phone number to a chat or channel


<br/>


`Function SendContact(Val Token, Val ContactName, Val PhoneNumber, Val UserID, Val SendingToChannel) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ContactName | --name | String | Contact name |
 | PhoneNumber | --phone | String | Phone number |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
 
 BotToken = "523b5b25ed27e6ec-111111111111111-2222222222222222";
 UserID = "d3jxe1111111111jYGgZg==";
 
 Response = OPI_Viber.SendContact(BotToken, "John Doe", "+749521231", UserID, False); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint viber SendContact --token %token% --name %name% --phone %phone% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel%

```

```json title="Result"
{
 "billing_status": 1,
 "chat_hostname": "SN-CHAT-15_",
 "message_token": 5925747984748149627,
 "status_message": "ok",
 "status": 0
 }
```
