---
sidebar_position: 8
---

# Forward message
 Forwards an existing message to the current dialog box



`Function ForwardMessage(Val Token, Val MessageID, Val FromChatID, Val ChatID, Val Text = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | MessageID | --messageid | String, Number | Original message ID |
  | FromChatID | --fromid | String, Number | Source chat ID |
  | ChatID | --chatid | String, Number | Chat ID for message sending |
  | Text | --text | String | Additional message text |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK Teams

<br/>

:::tip
Only the chatId from events can be passed to the FromChatID (the code from the chat link is not suitable))

 Method at API documentation: [GET /messages/sendText](https://teams.vk.com/botapi/#/messages/get_messages_sendText)
:::
<br/>


```bsl title="Code example"
    Token      = "001.3501506236.091...";
    ChatID     = "AoLI0egLWBSLR1Ngn2w";
    FromChatID = "689203963@chat.agent";
    MessageID  = "7425684917876428136";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID);

    Text = "Additional text";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);
```
 



```json title="Result"
{
 "msgId": "7423657667542911288",
 "ok": true
}
```
