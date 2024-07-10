---
sidebar_position: 1
---

# Get authorization link
 Forms a link for authorization via the browser


<br/>


`Function GetAuthorizationLink(Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: String - URL for browser transition

<br/>




```bsl title="Code example"
 
 Response = OPI_Twitter.GetAuthorizationLink(Parameters);
 
```
	


```sh title="CLI command example"
 
 oint twitter GetAuthorizationLink --auth %auth%

```

```json title="Result"
 "https://twitter.com/i/oauth2/authorize?response_type=code&client_id=ZG1vSmxlVTJXYi05M2c0ek9iV246MTpjaQ&redirect_uri=https%3A%2F%2Fapi.athenaeum.digital%2Fopi%2Fhs%2Ftwitter&scope=tweet.read%20tweet.write%20tweet.moderate.write%20users.read%20follows.read%20follows.write%20offline.access%20space.read%20mute.read%20mute.write%20like.read%20like.write%20list.read%20list.write%20block.read%20block.write%20bookmark.read%20bookmark.write&state=state&code_challenge=challenge&code_challenge_method=plain"
```
