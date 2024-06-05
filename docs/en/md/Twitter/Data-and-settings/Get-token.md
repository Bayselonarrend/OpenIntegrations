---
sidebar_position: 2
---

# Get token
 Gets the token by the code obtained during authorization via the link from GetAuthorizationLink


*Function GetToken(Val Code, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Code | --code | String | Code obtained from authorization See GetAuthorizationLink |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - serialized JSON response from Twitter

```bsl title="Code example"
	
 
 Response = OPI_Twitter.GetToken(Code, Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint twitter GetToken --code %code% --auth %auth%


```


```json title="Result"

{
 "refresh_token": "TmttM11111111111111111MY2dkNy1EZklLNmxIT1111111111111111xNTg2ODI6MTowOnJ0OjE",
 "access_token": "UTBtWXd11111111111111111111113TkRxWEdxdF9hVlQzOjE3MDUwNTMxNTg2ODE6MTowOmF0OjE",
 "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
 "expires_in": 7200,
 "token_type": "bearer"
 }

```
