﻿---
sidebar_position: 3
---

# Refresh token
 Gets a new token based on the refresh token



`Function RefreshToken(Val AppKey, Val AppSecret, Val RefreshToken) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | AppKey | --appkey | String | Application key |
  | AppSecret | --appsecret | String | Application secret |
  | RefreshToken | --refresh | String | Refresh token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
  AppKey = "oynqxds...";
  AppSecret = "tk2oewn...";
  RefreshToken = "oZFWg3DmZ_IAAAAAAAAAAWilOA0M1SjV...";
  
  Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);
```
 



```json title="Result"
{
  "access_token": "sl.B2M8yVLTS_ojO3UsFs2tRlXxkFh50RLOkroi3SLCwcjA2xX58JY__GXKh9vPGnGcfDkkTJJYB1Wn9tFvj6cRs3w04TnfaBQnJiOfUb58UHexTCAdck9xNFIBAQjuAQKUtkoht66bvsu4oh6Wl6gQpvU",
  "token_type": "bearer",
  "expires_in": 14400
  }
```
