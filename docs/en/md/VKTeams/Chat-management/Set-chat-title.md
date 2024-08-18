---
sidebar_position: 12
---

# Set chat title
 Sets new chat title



`Function SetChatTitle(Val Token, Val ChatID, Val Text) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | Text | --text | String | Title text |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET ​​/chats/setTitle](https://teams.vk.com/botapi/#/chats/get_chats_setTitle)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "689203963@chat.agent";
    Text   = "New title";

    Result = OPI_VKTeams.SetChatTitle(Token, ChatID, Text);
```



```sh title="CLI command example"
    
  oint vkteams SetChatTitle --token "001.3501506236.091..." --chatid "689203963@chat.agent" --text %text%

```

```json title="Result"

```
