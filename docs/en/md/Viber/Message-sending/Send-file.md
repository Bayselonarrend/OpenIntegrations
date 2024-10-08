﻿---
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
    URL       = "https://openyellow.neocities.org/test_data/document.docx";

    UserID           = "d3jxe61Z4W73nmNkjYGgZg==";
    Token            = "523b5b25ed27e6ec-fdf013e4...";
    SendingToChannel = False;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    UserID           = "tMNGhftyUPrB3r1lD+bT4g==";
    Token            = "523b58ba82afffaa-7ef3b426...";
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);
```



```sh title="CLI command example"
    
  oint viber SendFile --token %token% --file %file% --user "tMNGh111111111D+bT4g" --ischannel %ischannel% --ext %ext% --size %size%

```

```json title="Result"
{
 "status": 0,
 "status_message": "ok",
 "message_token": 6024682567270547758,
 "chat_hostname": "SN-CHAT-01_",
 "billing_status": 3
}
```
