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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendVoice](https://teams.vk.com/botapi/#/messages/get_messages_sendVoice)
:::
<br/>


```bsl title="Code example"
  Token  = "001.3501506236.091...";
  ChatID = "AoLI0egLWBSLR1Ngn2w";
  FileID = "I000bPVBYaNQkn9Fg3oY0066ba35811bd";
  
  Result = OPI_VKTeams.ResendVoice(Token, ChatID, FileID);
```



```sh title="CLI command example"
    
  oint vkteams ResendVoice --token %token% --chatid %chatid% --fileid %fileid%

```

```json title="Result"

```
