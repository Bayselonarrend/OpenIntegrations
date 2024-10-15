---
sidebar_position: 6
---

# Get chat blocked users
 Gets the list of blocked chat users



`Function GetChatBlockedUsers(Val Token, Val ChatID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET ​/chats​/getBlockedUsers](https://teams.vk.com/botapi/#/chats/get_chats_getBlockedUsers)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";

    Result = OPI_VKTeams.GetChatBlockedUsers(Token, ChatID);
```
 



```json title="Result"
{
 "users": [],
 "ok": true
}
```
