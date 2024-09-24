---
sidebar_position: 9
---

# Unblock chat user
 Unblocks a previously blocked user in the chat room



`Function UnblockChatUser(Val Token, Val ChatID, Val UserID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | UserID | --userid | String, Number | User ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET ​​/chats/unblockUser](https://teams.vk.com/botapi/#/chats/get_chats_unblockUser)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "689203963@chat.agent";
    User   = 1011987091;

    Result = OPI_VKTeams.UnblockChatUser(Token, ChatID, User);
```



```sh title="CLI command example"
    
  oint vkteams UnblockChatUser --token "001.3501506236.091..." --chatid "689203963@chat.agent" --userid %userid%

```

```json title="Result"
{
 "ok": true
}
```
