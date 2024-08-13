---
sidebar_position: 2
---

# Get token
 Get token by auth code



`Function GetToken(Val ClientID, Val ClientSecret, Val Code) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client ID from app settings |
  | ClientSecret | --clientsecret | String | Client secret from app settings |
  | Code | --code | String | Code from browser auth page |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
    ClientID     = "local.6667fc928a50a9.70414732";
    ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
    Code         = "2b096866006e9f06006b12e400000001000007fc1bc681f7ed7f13f2d449980628008c";

    Result = OPI_Bitrix24.GetToken(ClientID, ClientSecret, Code);
```



```sh title="CLI command example"
    
  oint bitrix24 GetToken --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --code "2b096866006e9f06006b12e400000001000007fc1bc681f7ed7f13f2d449980628008c"

```

```json title="Result"
{
  "error": "expired_token",
  "error_description": "The authorization token provided has expired."
  }
```
