---
sidebar_position: 6
---

# Resend file
 Sends a previously uploaded file by ID



`Function ResendFile(Val Token, Val ChatID, Val FileID, Val Text = "", Val Markup = "MarkdownV2") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for sending |
  | FileID | --fileid | String, Number | File ID to send |
  | Text | --text | String | File caption |
  | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendFile](https://teams.vk.com/botapi/#/messages/get_messages_sendFile)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";
    FileID = "Z7w4zb94bLtkJDICBfzVuG66f69e921bd";
    Text   = "File caption";

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text, "SameDoc.docx");
```



```sh title="CLI command example"
    
  oint vkteams ResendFile --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --fileid "sXhpbA5K2ZCOdG5ROIfRan66ba356d1bd" --text "File caption" --filename %filename% --parsemod %parsemod%

```

```json title="Result"
{
 "fileId": "UevBE3dRlqHftBiESLglDn670621531bd",
 "msgId": "7423657697607682364",
 "ok": true
}
```
