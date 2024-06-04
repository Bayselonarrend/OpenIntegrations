---
sidebar_position: 4
---

# Get online users
 Gets the status of a user or several users by ID


*Function GetOnlineUsers(Val Token, Val UserIDs) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Viber Token |
 | UserIDs | --users | String,Number,Array of String,Number | Viber User(s) ID |

 
 Returns: Key-Value Pair - serialized JSON response from Viber

```bsl title="Code example"
	
 
 Response = OPI_Viber.GetOnlineUsers(Token, UserID); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint viber GetOnlineUsers --token %token% --users %users%

```


```json title="Result"

{
 "users": [
 {
 "last_online": 1704796869778,
 "online_status_message": "offline",
 "online_status": 1,
 "id": "d3jxe111111111YGgZg=="
 }
 ],
 "status_message": "ok",
 "status": 0
 }

```
