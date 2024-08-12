---
sidebar_position: 8
---

# Forward message
 Forwards an existing message to the current dialog box



`Function ForwardMessage(Val Token, Val MessageID, Val FromChatID, Val ChatID, Val Text = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | MessageID | --message | String, Number | Original message ID |
 | FromChatID | --fromid | String, Number | Source chat ID |
 | ChatID | --chatid | String, Number | Chat ID for message sending |
 | Text | --text | String | Additional message text |

 
 Returns: HTTPResponse - Forward message

<br/>

:::tip
Only the chatId from events can be passed to the FromChatID (the code from the chat link is not suitable))

 Method at API documentation: [GET /messages/sendText](https://teams.vk.com/botapi/#/messages/get_messages_sendText)
:::
<br/>


```bsl title="Code example"
 Token = "001.3501506236.091...";
 ChatID = "AoLI0egLWBSLR1Ngn2w";
 FromChatID = "689203963@chat.agent";
 MessageID = "7402287649739767956";
 
 Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID);
 
 Text = "Additional text";
 
 Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);
```
	


```sh title="CLI command example"
 
 oint vkteams ForwardMessage --token %token% --message %message% --fromid %fromid% --chatid %chatid% --text %text%

```

```json title="Result"
{
 "msgId": "7401634788940972096",
 "ok": true
}
```
