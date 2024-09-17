---
sidebar_position: 1
---

# Send text message
 Sends a text message to a chat or channel



`Function SendTextMessage(Val Token, Val Text, Val UserID, Val SendingToChannel, Val Keyboard = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Text | --text | String | Message text |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |
  | Keyboard | --keyboard | Structure Of String | See CreateKeyboardFromArrayButton |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Text = "TestMessage";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);
```



```sh title="CLI command example"
    
  oint viber SendTextMessage --token %token% --text %text% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel% --keyboard %keyboard%

```

```json title="Result"
{
  "chat_hostname": "SN-CHAT-10_",
  "message_token": 5925400810709476620,
  "status_message": "ok",
  "status": 0
  }
```
