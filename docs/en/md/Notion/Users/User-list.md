---
sidebar_position: 1
---

# User list
 Returns a list of workspace users


*Function UserList(Val Token) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |

 
 Returns: Key-Value Pair - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Response = OPI_Notion.UserList(Token);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint notion UserList --token "secret_9RsfMrRMqZwqp0Zl0B..."


```


```json title="Result"

{
 "request_id": "ea9a6b96-0b02-4866-a60a-2958e514af38",
 "user": {},
 "type": "user",
 "has_more": false,
 "next_cursor": null,
 "results": [
 {
 "person": {
 "email": "ex@gmail.com"
 },
 "type": "person",
 "avatar_url": null,
 "name": "Bayselonarrends",
 "id": "ed71865a-9891-1111-86cd-11111111",
 "object": "user"
 },
 {
 "type": "bot",
 "avatar_url": null,
 "name": "1C Integration",
 "bot": {
 "workspace_name": "Bayselonarrends Notion",
 "owner": {
 "workspace": true,
 "type": "workspace"
 }
 },
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 }
 ],
 "object": "list"
 }

```
