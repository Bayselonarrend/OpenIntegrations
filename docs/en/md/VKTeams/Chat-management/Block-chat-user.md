---
sidebar_position: 8
---

# Block chat user
 Blocks the selected user in chat



`Function BlockChatUser(Val Token, Val ChatID, Val UserID, Val DeleteLastMessages = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | UserID | --userid | String, Number | User ID to be blocked |
  | DeleteLastMessages | --dellast | Boolean | Delete last messages before blocking |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET ​​/chats​/blockUser](https://teams.vk.com/botapi/#/chats/get_chats_blockUser)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "689203963@chat.agent";
    User   = 1011987091;

    Result = OPI_VKTeams.BlockChatUser(Token, ChatID, User, True);
```



```sh title="CLI command example"
    
  oint vkteams BlockChatUser --token "001.3501506236.091..." --chatid "689203963@chat.agent" --userid %userid% --dellast %dellast%

```

```json title="Result"
{
 "ok": true
}
```
