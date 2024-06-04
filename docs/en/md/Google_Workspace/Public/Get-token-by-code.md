---
sidebar_position: 2
---

# Get token by code
 Gets token by code from browser authorization


*Function GetTokenByCode(Val ClientID, Val ClientSecret, Val Code) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ClientID | --id | String | Client ID |
 | ClientSecret | --secret | String | Client secret |
 | Code | --code | String | Code from browser |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint google GetTokenByCode --id %id% --secret %secret% --code %code%

```


```json title="Result"



```
