---
sidebar_position: 5
---

# Send location
 Sends geographic coordinates to a chat or channel



`Function SendLocation(Val Token, Val Latitude, Val Longitude, Val UserID, Val SendingToChannel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Latitude | --lat | String, Number | Geographic latitude |
  | Longitude | --long | String, Number | Geographic longitude |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);
```



```sh title="CLI command example"
    
  oint viber SendLocation --token %token% --lat %lat% --long %long% --user "d3jxe1111111111jYGgZg" --ischannel %ischannel%

```

```json title="Result"
{
  "billing_status": 1,
  "chat_hostname": "SN-CHAT-10_",
  "message_token": 5925751017338988046,
  "status_message": "ok",
  "status": 0
  }
```
