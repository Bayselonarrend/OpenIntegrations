﻿---
sidebar_position: 5
---

# Delete message
 Deletes a message by ID



`Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for message sending |
  | MessageID | --messageid | String, Number | Message ID for editing |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/deleteMessages](https://teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
:::
<br/>


```bsl title="Code example"
    Token     = "001.3501506236.091...";
    ChatID    = "689203963@chat.agent";
    MessageID = "7424418276186262625";

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);
```
 



```json title="Result"
{
 "ok": true
}
```
