---
sidebar_position: 1
---

# Get app authentication link
 Forms a link for authorization via the browser


*Function GetAppAuthLink(Val Domain, Val ClientID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Domain | --domain | String | Current Bitrix URL (like 'portal.bitrix24.com') |
 | ClientID | --clientid | String | Client ID from app settings |

 
 Returns: String - URL for browser transition

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint bitrix24 GetAppAuthLink --domain %domain% --clientid %clientid%

```


```json title="Result"

"https://b24-ar17wx.bitrix24.by/oauth/authorize/?client_id=local.6667fc928a50a9.70414732"

```
