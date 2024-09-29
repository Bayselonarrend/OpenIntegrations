---
sidebar_position: 2
---

# Send image
 Sends an image to a chat or channel



`Function SendImage(Val Token, Val URL, Val UserID, Val SendingToChannel, Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | URL | --picture | String | Image URL |
  | UserID | --user | String, Number | User ID. For channel > administrator, for bot > recipient |
  | SendingToChannel | --ischannel | boolean | Sending to channel or bot chat |
  | Description | --description | String | Image annotation |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Description = "TestMessage";
    URL         = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";

    UserID           = "d3jxe61Z4W73nmNkjYGgZg==";
    Token            = "523b5b25ed27e6ec-fdf013e4...";
    SendingToChannel = False;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    UserID           = "tMNGhftyUPrB3r1lD+bT4g==";
    Token            = "523b58ba82afffaa-7ef3b426...";
    SendingToChannel = True;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);
```



```sh title="CLI command example"
    
  oint viber SendImage --token %token% --picture %picture% --user "tMNGh111111111D+bT4g" --ischannel %ischannel% --description %description%

```

```json title="Result"

```
