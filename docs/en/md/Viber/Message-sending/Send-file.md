---
sidebar_position: 3
---

# Send file
 Sends a file (document) to a chat or channel



`Function SendFile(Val Token, Val URL, Val UserID, Val SendingToChannel, Val Extension, Val Size = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --file | String | File URL |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |
  | Extension | --ext | String | File extension |
  | Size | --size | Number | File size. If not filled in > determined automatically by downloading the file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);
```



```sh title="CLI command example"
    
  oint viber SendFile --token %token% --file %file% --user "tMNGh111111111D+bT4g" --ischannel %ischannel% --ext %ext% --size %size%

```

```json title="Result"
{
  "chat_hostname": "SN-CHAT-09_",
  "message_token": 5925491906424759104,
  "status_message": "ok",
  "status": 0
  }
```
