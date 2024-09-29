---
sidebar_position: 4
---

# Get online users
 Gets the status of a user or multiple users by ID



`Function GetOnlineUsers(Val Token, Val UserIDs) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Viber Token |
  | UserIDs | --users | String,Number,Array of String,Number | Viber User(s) ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Viber

<br/>




```bsl title="Code example"
    Token  = "523b58ba82afffaa-7ef3b426...";
    UserID = "tMNGhftyUPrB3r1lD+bT4g==";

    Result = OPI_Viber.GetOnlineUsers(Token, UserID);
```



```sh title="CLI command example"
    
  oint viber GetOnlineUsers --token %token% --users %users%

```

```json title="Result"
{
 "status": 0,
 "status_message": "ok",
 "users": [
  {
   "id": "tMNGhftyUPrB3r1lD+bT4g==",
   "online_status": 4,
   "online_status_message": "unavailable",
   "last_online": 0
  }
 ]
}
```
