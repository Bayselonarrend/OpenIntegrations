---
sidebar_position: 4
---

# Change the message text
 Changes the text of an existing message



`Function EditMessageText(Val Token, Val ChatID, Val MessageID, Val Text, Val Markup = "MarkdownV2") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for message sending |
  | MessageID | --messageid | String, Number | Message ID for editing |
  | Text | --text | String | New message text |
  | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
You can mention a user by appending their userId to the text in the following format @[userId]

 Method at API documentation: [GET /messages/editText](https://teams.vk.com/botapi/#/messages/get_messages_editText)
:::
<br/>


```bsl title="Code example"
  Token     = "001.3501506236.091...";
  ChatID    = "689203963@chat.agent";
  MessageID = "7402287649739767956";
  Text      = "New message text";
  
  Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text);
  
  Text   = "<b>New bold message text</b>";
  Markup = "HTML";
  
  Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text, Markup);
```



```sh title="CLI command example"
    
  oint vkteams EditMessageText --token "001.3501506236.091..." --chatid "689203963@chat.agent" --messageid "7402287649739767956" --text %text% --parsemod "HTML"

```

```json title="Result"

```
