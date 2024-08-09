---
sidebar_position: 1
---

# Send text message
 Sends a text message to a chat



`Function SendTextMessage(Val Token, Val ChatID, Val Text, Val ReplyID = 0, Val Keyboard = "", Val Markup = "MarkdownV2") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for message sending |
 | Text | --text | String | Message text |
 | ReplyID | --reply | String, Number | Replying message id if necessary |
 | Keyboard | --keyboard | Array Of String | Buttons to the message if necessary |
 | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
You can mention a user by appending their userId to the text in the following format @[userId]

 Method at API documentation: [GET /messages/sendText](https://teams.vk.com/botapi/#/messages/get_messages_sendText)
:::
<br/>


	


```sh title="CLI command example"
 
 oint vkteams SendTextMessage --token %token% --chatid %chatid% --text %text% --reply %reply% --keyboard %keyboard% --parsemod %parsemod%

```


