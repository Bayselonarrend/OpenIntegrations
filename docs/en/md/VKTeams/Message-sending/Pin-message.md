---
sidebar_position: 9
---

# Pin message
 Pins the selected message in the chat room



`Function PinMessage(Val Token, Val ChatID, Val MessageID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | MessageID | --messageid | String, Number | ID of the message to be pinned |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room

 Method at API documentation: [GET /chats/pinMessage](https://teams.vk.com/botapi/#/chats/get_chats_pinMessage)
:::
<br/>


```bsl title="Code example"
    Token     = "001.3501506236.091...";
    ChatID    = "689203963@chat.agent";
    MessageID = "7401463509940174907";

    Result = OPI_VKTeams.PinMessage(Token, ChatID, MessageID);
```



```sh title="CLI command example"
    
  oint vkteams PinMessage --token "001.3501506236.091..." --chatid "689203963@chat.agent" --messageid "7401463509940174907"

```

```json title="Result"
{
 "ok": true
}
```
