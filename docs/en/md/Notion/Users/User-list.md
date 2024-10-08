---
sidebar_position: 1
---

# User list
 Returns a list of workspace users



`Function UserList(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";

    Result = OPI_Notion.UserList(Token);
```



```sh title="CLI command example"
    
  oint notion UserList --token "secret_9RsfMrRMqZwqp0Zl0B..."

```

```json title="Result"
{
 "object": "list",
 "results": [
  {
   "object": "user",
   "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
   "name": "Techno Pizza",
   "avatar_url": null,
   "type": "person",
   "person": {
    "email": "iscript13@gmail.com"
   }
  },
  {
   "object": "user",
   "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
   "name": "1C Integration",
   "avatar_url": null,
   "type": "bot",
   "bot": {
    "owner": {
     "type": "workspace",
     "workspace": true
    },
    "workspace_name": "Bayselonarrends Notion"
   }
  }
 ],
 "next_cursor": null,
 "has_more": false,
 "type": "user",
 "user": {},
 "request_id": "2f771720-92f3-4824-b0ae-f8aa0b938d8d"
}
```
