---
sidebar_position: 2
---

# Get workspace list
 Gets a list of workspaces where the bot is connected



`Function GetWorkspaceList(Val Token, Val Cursor = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 
 Response = OPI_Slack.GetWorkspaceList(Token); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint slack GetWorkspaceList --token %token% --cursor %cursor%

```

```json title="Result"
{
 "ok": true,
 "teams": [
 {
 "id": "T06UD92BS3C",
 "name": "OpenIntegrations"
 }
 ]
 }
```
