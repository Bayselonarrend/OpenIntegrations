---
sidebar_position: 2
---

# SendFile
 Sends the file to the chat



`Function SendFile(Val Token, Val ChatID, Val File, Val Text = "", Val FileName = "", Val Markup = "MarkdownV2") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for sending |
 | File | --file | BinaryData, String | File for sending |
 | Text | --text | String | File caption |
 | FileName | --filename | String | Displayed file name |
 | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [POST /messages/sendFile](https://teams.vk.com/botapi/#/messages/post_messages_sendFile)
:::
<br/>


	


```sh title="CLI command example"
 
oint vkteams SendFile --token %token% --chatid %chatid% --file %file% --text %text% --filename %filename% --parsemod %parsemod%

```

```json title="Result"
{
 "fileId": "XrJ30XSsGyVg0tOK52eUzi66b7e3a21bd",
 "msgId": "7401634797530906691",
 "ok": true
}
```
