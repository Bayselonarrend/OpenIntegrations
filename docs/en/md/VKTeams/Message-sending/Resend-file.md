---
sidebar_position: 5
---

# Resend file
 Sends a previously uploaded file by ID



`Function ResendFile(Val Token, Val ChatID, Val FileID, Val Text = "", Val FileName = "", Val Markup = "MarkdownV2") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for sending |
 | FileID | --fileid | String, Number | File ID to send |
 | Text | --text | String | File caption |
 | FileName | --filename | String | Displayed file name |
 | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendFile](https://teams.vk.com/botapi/#/messages/get_messages_sendFile)
:::
<br/>


	


```sh title="CLI command example"
 
oint vkteams ResendFile --token %token% --chatid %chatid% --fileid %fileid% --text %text% --filename %filename% --parsemod %parsemod%

```

```json title="Result"
{
 "fileId": "XrJ30XSsGyVg0tOK52eUzi66b7e3a21bd",
 "msgId": "7401634819005743172",
 "ok": true
}
```
