---
sidebar_position: 1
---

# Send text message
 Sends a text message to a chat or channel


*Function SendTextMessage(Val Token, Val Text, Val UserID, Val SendingToChannel, Val Keyboard = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Text | --text | String | Message text |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |
 | Keyboard | --keyboard | Structure Of String | See CreateKeyboardFromArrayButton |

 
 Returns: Key-Value Pair - serialized JSON response from Viber

```bsl title="Code example"
	
 
 BotToken = "523b5b25ed27e6ec-111111111111111-2222222222222222";
 UserID = "d3jxe1111111111jYGgZg==";
 
 ButtonArray = New Array;
 
 ButtonArray.Add("Button 1");
 ButtonArray.Add("Button 2");
 ButtonArray.Add("Button 3");
 
 Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);
 
 Response = OPI_Viber.SendTextMessage(BotToken, "Hello", UserID, False, Keyboard); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint viber SendTextMessage --token %token% --text %text% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel% --keyboard %keyboard%


```


```json title="Result"

{
 "chat_hostname": "SN-CHAT-10_",
 "message_token": 5925400810709476620,
 "status_message": "ok",
 "status": 0
 }

```
