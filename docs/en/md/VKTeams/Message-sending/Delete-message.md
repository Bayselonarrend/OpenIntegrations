---
sidebar_position: 4
---

# Delete message
 Deletes a message by ID



`Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for message sending |
 | MessageID | --messageid | String, Number | Message ID for editing |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/deleteMessages](https://teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
:::
<br/>


	


```sh title="CLI command example"
 
oint vkteams DeleteMessage --token %token% --chatid %chatid% --messageid %messageid%

```


