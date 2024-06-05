---
sidebar_position: 3
---

# SendFile
 Sends a file (document) to a chat or channel


*Function SendFile(Val Token, Val URL, Val UserID, Val SendingToChannel, Val Extension, Val Size = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | URL | --file | String | File URL |
 | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
 | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |
 | Extension | --ext | String | File extension |
 | Size | --size | Number | File size. If not filled in > determined automatically by downloading the file |

 
 Returns: Key-Value Pair - serialized JSON response from Viber

```bsl title="Code example"
	
 
 ChannelToken = "523b58ba82afffaa-111111111111111-2222222222222222";
 UserID = "tMNGh111111111D+bT4g==";
 
 Response = OPI_Viber.SendFile(ChannelToken, "https://api.athenaeum.digital/1.txt", UserID, True, "txt"); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint viber SendFile --token %token% --file %file% --user "tMNGh111111111D+bT4g" --ischannel %ischannel% --ext %ext% --size %size%


```


```json title="Result"

{
 "chat_hostname": "SN-CHAT-09_",
 "message_token": 5925491906424759104,
 "status_message": "ok",
 "status": 0
 }

```
