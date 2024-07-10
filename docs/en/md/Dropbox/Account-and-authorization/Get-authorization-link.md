---
sidebar_position: 1
---

# Get authorization link
 Generates an authorization link for browser transition


<br/>


`Function GetAuthorizationLink(Val AppKey) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | AppKey | --appkey | String | Application key |

 
 Returns: String - URL for browser transition





```bsl title="Code example"
 AppKey = "oynqxds...";
 Result = OPI_Dropbox.GetAuthorizationLink(AppKey);
```
	


```sh title="CLI command example"
 
 oint dropbox GetAuthorizationLink --appkey "oynqxds..."

```

```json title="Result"
 "https://www.dropbox.com/oauth2/authorize?client_id=oynqxdsqft8oyky&response_type=code&token_access_type=offline"
```
