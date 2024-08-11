---
sidebar_position: 3
---

# Change the message text
 Changes the text of an existing message



`Function EditMessageText(Val Token, Val ChatID, Val MessageID, Val Text, Val Markup = "MarkdownV2") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for message sending |
 | MessageID | --messageid | String, Number | Message ID for editing |
 | Text | --text | String | New message text |
 | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
You can mention a user by appending their userId to the text in the following format @[userId]

 Method at API documentation: [GET /messages/editText](https://teams.vk.com/botapi/#/messages/get_messages_editText)
:::
<br/>


	


```sh title="CLI command example"
 
oint vkteams EditMessageText --token %token% --chatid %chatid% --messageid %messageid% --text %text% --parsemod %parsemod%

```

```json title="Result"
{
 "ok": true
}
```
