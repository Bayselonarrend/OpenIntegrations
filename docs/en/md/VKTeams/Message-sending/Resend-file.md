﻿---
sidebar_position: 6
---

# Resend file
 Sends a previously uploaded file by ID



`Function ResendFile(Val Token, Val ChatID, Val FileID, Val Text = "", Val FileName = "", Val Markup = "MarkdownV2") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for sending |
  | FileID | --fileid | String, Number | File ID to send |
  | Text | --text | String | File caption |
  | FileName | --filename | String | Displayed file name |
  | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendFile](https://teams.vk.com/botapi/#/messages/get_messages_sendFile)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";
    FileID = "ZkZgp98NdoukByPb3s8tGk66dffe4c1bd";
    Text   = "File caption";

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text, "SameDoc.docx");
```



```sh title="CLI command example"
    
  oint vkteams ResendFile --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --fileid "sXhpbA5K2ZCOdG5ROIfRan66ba356d1bd" --text "File caption" --filename %filename% --parsemod %parsemod%

```

```json title="Result"
{
 "fileId": "vqgXEg5z1gyjeolUD8vFEK66bb96aa1bd",
 "msgId": "7402676090876985564",
 "ok": true
}
```
