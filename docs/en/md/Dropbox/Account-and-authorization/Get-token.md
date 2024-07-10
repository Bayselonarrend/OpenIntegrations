---
sidebar_position: 2
---

# Get token
 Gets token based on the code from the GetAuthorizationLink page


<br/>


`Function GetToken(Val AppKey, Val AppSecret, Val Code) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | AppKey | --appkey | String | Application key |
 | AppSecret | --appsecret | String | Application secret |
 | Code | --code | String | Code from the authorization page |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 AppKey = "oynqxds...";
 AppSecret = "tk2oewn...";
 Code = "bTCiUTzxe6kAAAAAAAAAGN1NMZIxyqETKr4o7OS2dU8";
 
 Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);
```
	


```sh title="CLI command example"
 
 oint dropbox GetToken --appkey "oynqxds..." --appsecret "tk2oewn..." --code "bTCiUTzxe6kAAAAAAAAAGN1NMZIxyqETKr4o7OS2dU8"

```

```json title="Result"
 {
 "error": "invalid_grant",
 "error_description": "code doesn't exist or has expired"
}
```
