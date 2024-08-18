---
sidebar_position: 3
---

# Get information about the chat room
 Gets basic information about the chat



`Function GetChatInfo(Val Token, Val ChatID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /chats/getInfo](https://teams.vk.com/botapi/#/chats/get_chats_getInfo)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";

    Result = OPI_VKTeams.GetChatInfo(Token, ChatID);
```



```sh title="CLI command example"
    
  oint vkteams GetChatInfo --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w"

```

```json title="Result"
{
 "inviteLink": "https://icq.com/chat/AoLI0egLWBSLR1Ngn2w",
 "joinModeration": false,
 "public": false,
 "title": "Тест2",
 "type": "group",
 "ok": true
}
```
