---
sidebar_position: 6
---

# Send link
 Sends a URL with a preview to a chat or channel



`Function SendLink(Val Token, Val URL, Val UserID, Val SendingToChannel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --url | String | SentLink |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | Boolean | Sending to channel or bot chat |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = "d3jxe61Z4W73nmNkjYGgZg==";
    Token            = "523b5b25ed27e6ec-fdf013e4...";
    SendingToChannel = False;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    UserID           = "tMNGhftyUPrB3r1lD+bT4g==";
    Token            = "523b58ba82afffaa-7ef3b426...";
    SendingToChannel = True;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);
```
 



```json title="Result"
{
 "status": 0,
 "status_message": "ok",
 "message_token": 6024682655669700844,
 "chat_hostname": "SN-CHAT-03_",
 "billing_status": 3
}
```
