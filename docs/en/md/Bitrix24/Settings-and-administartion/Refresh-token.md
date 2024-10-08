---
sidebar_position: 3
---

# Refresh token
 Update token by refresh token



`Function RefreshToken(Val ClientID, Val ClientSecret, Val Refresh) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client ID from app settings |
  | ClientSecret | --clientsecret | String | Client secret from app settings |
  | Refresh | --refresh | String | Refresh token |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>




```bsl title="Code example"
    ClientID     = "local.6667fc928a50a9.70414732";
    ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
    Refresh      = "27502667006e9f06006b12e400000001000...";

    Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);
```



```sh title="CLI command example"
    
  oint bitrix24 RefreshToken --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --refresh "eebed066006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "access_token": "7c430467006e9f06006b12e4000000010000071103f1c469e314f967ff9f4fd9ddbb4d",
 "expires": 1728332668,
 "expires_in": 3600,
 "scope": "app",
 "domain": "oauth.bitrix.info",
 "server_endpoint": "https://oauth.bitrix.info/rest/",
 "status": "L",
 "client_endpoint": "https://b24-ar17wx.bitrix24.by/rest/",
 "member_id": "00168f0dd11ff00b4aeb8ce5befaa139",
 "user_id": 1,
 "refresh_token": "6cc22b67006e9f06006b12e4000000010000070ce616b749f4aa9061db525a3de43a80"
}
```
