﻿---
sidebar_position: 2
---

# Get user data
 Gets user data by ID



`Function GetUserData(Val Token, Val UserID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | UserID | --user | String | Target user ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    User  = "ed71865a-9891-46bc-86cd-a92aa499cfdb";

    Result = OPI_Notion.GetUserData(Token, User);
```



```sh title="CLI command example"
    
  oint notion GetUserData --token "secret_9RsfMrRMqZwqp0Zl0B..." --user "ed71865a989146bc86cdwdf24..."

```

```json title="Result"
{
 "object": "user",
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "name": "Techno Pizza",
 "avatar_url": null,
 "type": "person",
 "person": {
  "email": "iscript13@gmail.com"
 },
 "request_id": "a6fc9071-fac0-4069-84ba-e724b783d9ce"
}
```
