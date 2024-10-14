---
sidebar_position: 7
---

# Resend voice
 Sends a previously uploaded voice message by ID



`Function ResendVoice(Val Token, Val ChatID, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for sending |
  | FileID | --fileid | String, Number | File ID of voice message |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendVoice](https://teams.vk.com/botapi/#/messages/get_messages_sendVoice)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";
    FileID = "I000bzdU0pRaLPRFQ42mv6670d55531bd";

    Result = OPI_VKTeams.ResendVoice(Token, ChatID, FileID);
```



```sh title="CLI command example"
    
  oint vkteams ResendVoice --token %token% --chatid %chatid% --fileid %fileid%

```

```json title="Result"
{
 "fileId": "I000bPC37Th9syNcxyaG4r670621651bd",
 "msgId": "7423657774917093693",
 "ok": true
}
```
