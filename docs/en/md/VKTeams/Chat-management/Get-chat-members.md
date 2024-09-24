---
sidebar_position: 5
---

# Get chat members
 Gets the list of chat members



`Function GetChatMembers(Val Token, Val ChatID, Val Cursor = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | Cursor | --cursor | String | Next page marker from the previous request |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /chats/getMembers](https://teams.vk.com/botapi/#/chats/get_chats_getMembers)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";

    Result = OPI_VKTeams.GetChatMembers(Token, ChatID);
```



```sh title="CLI command example"
    
  oint vkteams GetChatMembers --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --cursor %cursor%

```

```json title="Result"
{
 "members": [
  {
   "admin": true,
   "userId": "1011893356"
  },
  {
   "creator": true,
   "userId": "bayselonarrend@openintegrations.bizml.ru"
  },
  {
   "userId": "1011987091"
  }
 ],
 "ok": true
}
```
