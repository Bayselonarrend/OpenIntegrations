---
sidebar_position: 14
---

# Set chat rules
 Sets new chat rules



`Function SetChatRules(Val Token, Val ChatID, Val Text) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | Text | --text | String | Rules Text |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET /chats/setRules](https://teams.vk.com/botapi/#/chats/get_chats_setRules)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "689203963@chat.agent";
    Text   = "Text of the new rules";

    Result = OPI_VKTeams.SetChatRules(Token, ChatID, Text);
```



```sh title="CLI command example"
    
  oint vkteams SetChatRules --token "001.3501506236.091..." --chatid "689203963@chat.agent" --text %text%

```

```json title="Result"

```
