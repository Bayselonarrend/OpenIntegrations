﻿---
sidebar_position: 10
---

# Approve pending
 Confirms the user's request to join a private chat room



`Function ApprovePending(Val Token, Val ChatID, Val UserID = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | UserID | --userid | String, Number | User ID. For all active requests if not filled in |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
To call this method, the bot must be an administrator in the chat room.

 Method at API documentation: [GET ​​/chats/resolvePending](https://teams.vk.com/botapi/#/chats/get_chats_resolvePending)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "689203963@chat.agent";
    User   = 1011987091;

    Result = OPI_VKTeams.ApprovePending(Token, ChatID, User);

    Result = OPI_VKTeams.ApprovePending(Token, ChatID);
```



```sh title="CLI command example"
    
  oint vkteams ApprovePending --token "001.3501506236.091..." --chatid "689203963@chat.agent" --userid %userid%

```

```json title="Result"
{
 "ok": false,
 "description": "User is not pending or nobody in pending list"
}
```
