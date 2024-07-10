---
sidebar_position: 3
---

# Refresh token
 Update token by refresh token




<br/>


*Function RefreshToken(Val ClientID, Val ClientSecret, Val Refresh) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ClientID | --clientid | String | Client ID from app settings |
 | ClientSecret | --clientsecret | String | Client secret from app settings |
 | Refresh | --refresh | String | Refresh token |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API


```bsl title="Code example"
 ClientID = "local.6667fc928a50a9.70414732";
 ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
 Refresh = "a95e9b66006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);
```
	


```sh title="CLI command example"
 
 oint bitrix24 RefreshToken --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --refresh "a95e9b66006e9f06006b12e400000001000..."

```

```json title="Result"
 {
 "access_token": "63a46866006e9f06006b12e4000000010000071997e1f54c1043e9f7193734af3018df",
 "expires": 1718133859,
 "expires_in": 3600,
 "scope": "app",
 "domain": "oauth.bitrix.info",
 "server_endpoint": "https://oauth.bitrix.info/rest/",
 "status": "L",
 "client_endpoint": "https://b24-ar17wx.bitrix24.by/rest/",
 "member_id": "00168f0dd11ff00b4aeb8ce5befaa139",
 "user_id": 1,
 "refresh_token": "53239066006e9f06006b12e4000000010000078523b1fc75d58d6f0fa98b4632bc70ce"
}
```
