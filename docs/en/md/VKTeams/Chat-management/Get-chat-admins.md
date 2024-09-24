---
sidebar_position: 4
---

# Get chat admins
 Gets the list of chat administrators



`Function GetChatAdmins(Val Token, Val ChatID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /chats/getAdmins](https://teams.vk.com/botapi/#/chats/get_chats_getAdmins)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";

    Result = OPI_VKTeams.GetChatAdmins(Token, ChatID);
```



```sh title="CLI command example"
    
  oint vkteams GetChatAdmins --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w"

```

```json title="Result"
{
 "admins": [
  {
   "userId": "1011893356"
  },
  {
   "creator": true,
   "userId": "bayselonarrend@openintegrations.bizml.ru"
  }
 ],
 "ok": true
}
```
