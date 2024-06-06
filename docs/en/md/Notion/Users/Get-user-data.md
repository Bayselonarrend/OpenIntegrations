---
sidebar_position: 2
---

# Get user data
 Gets user data by ID


*Function GetUserData(Val Token, Val UserID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | UserID | --user | String | Target user ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 UserID = "ed71865a989146bc86cdwdf24...";
 
 Response = OPI_Notion.GetUserData(Token, UserID);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint notion GetUserData --token "secret_9RsfMrRMqZwqp0Zl0B..." --user "ed71865a989146bc86cdwdf24..."


```


```json title="Result"

{
 "request_id": "f33d34a8-f3cf-41b5-bdf5-4a07cf7d7118",
 "person": {
 "email": "ex@gmail.com"
 },
 "type": "person",
 "avatar_url": null,
 "name": "Bayselonarrend",
 "id": "ed71865a-9891-1111-86cd-1111111",
 "object": "user"
 }

```
