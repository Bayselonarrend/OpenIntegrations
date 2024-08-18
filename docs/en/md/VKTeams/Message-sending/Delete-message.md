---
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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/deleteMessages](https://teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
:::
<br/>


```bsl title="Code example"
    Token     = "001.3501506236.091...";
    ChatID    = "689203963@chat.agent";
    MessageID = "7401463509940174907";

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);
```



```sh title="CLI command example"
    
  oint vkteams DeleteMessage --token "001.3501506236.091..." --chatid "689203963@chat.agent" --messageid "7402287649739767956"

```

```json title="Result"
{
 "ok": true
}
```
