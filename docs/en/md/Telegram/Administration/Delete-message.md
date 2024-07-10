---
sidebar_position: 7
---

# Delete message
 Delete message from chat or channel


<br/>


`Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ChatID | --chat | String, Number | Target chat ID |
 | MessageID | --message | String, Number | ID of message to delete |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram





```bsl title="Code example"
 Token = "6129457865:AAFyzNYOAFbu...";
 ChatID = "@testsichee";
 MessageID = "5385";
 
 Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);
```
	


```sh title="CLI command example"
 
 oint telegram DeleteMessage --token "6129457865:AAFyzNYOAFbu..." --chat "@testsichee" --message "5385"

```

```json title="Result"
 {
 "ok": true,
 "result": true
}
```
