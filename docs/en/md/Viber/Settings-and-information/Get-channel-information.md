﻿---
sidebar_position: 2
---

# Get channel information
Here you can get the channel's user IDs. Bot IDs need to be obtained from the Webhook arrivals The user ID from channel information is not suitable for sending messages through the bot - they are different



`Function GetChannelInformation(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Token  = "523b58ba82afffaa-7ef3b426...";
    Result = OPI_Viber.GetChannelInformation(Token);
```



```sh title="CLI command example"
    
  oint viber GetChannelInformation --token %token%

```

```json title="Result"
{
 "status": 0,
 "status_message": "ok",
 "id": "pa:5925427292815753130",
 "chat_hostname": "SN-CHAT-08_",
 "name": "1C Test",
 "members": [
  {
   "id": "tMNGhftyUPrB3r1lD+bT4g==",
   "name": "John",
   "role": "superadmin"
  }
 ]
}
```
