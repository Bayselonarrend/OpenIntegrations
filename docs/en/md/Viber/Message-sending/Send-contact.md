---
sidebar_position: 4
---

# Send contact
 Sends a contact with a phone number to a chat or channel



`Function SendContact(Val Token, Val ContactName, Val PhoneNumber, Val UserID, Val SendingToChannel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | ContactName | --name | String | Contact name |
  | PhoneNumber | --phone | String | Phone number |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);
```



```sh title="CLI command example"
    
  oint viber SendContact --token %token% --name %name% --phone %phone% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel%

```

```json title="Result"
{
  "billing_status": 1,
  "chat_hostname": "SN-CHAT-15_",
  "message_token": 5925747984748149627,
  "status_message": "ok",
  "status": 0
  }
```
