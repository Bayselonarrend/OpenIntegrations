---
sidebar_position: 1
---

# Remove chat members
 Removes users from the chat



`Function RemoveChatMembers(Val Token, Val ChatID, Val Users) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | Users | --members | String, Number, Array of String, Number | The member or members of the chat room to remove |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /chats/members/delete](https://teams.vk.com/botapi/#/chats/get_chats_members_delete)
:::
<br/>


```bsl title="Code example"
  Token  = FunctionParameters["VkTeams_Token"];
  ChatID = FunctionParameters["VkTeams_ChatID2"];
  User   = 1011987091;
  
  Result = OPI_VKTeams.RemoveChatMembers(Token, ChatID, User);
```



```sh title="CLI command example"
    
  oint vkteams RemoveChatMembers --token %token% --chatid %chatid% --members %members%

```

```json title="Result"

```
