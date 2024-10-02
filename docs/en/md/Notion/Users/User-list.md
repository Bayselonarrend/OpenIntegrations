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
  Response = OPI_Notion.UserList(Token);
  Response = OPI_Tools.JSONString(Response);
```



```sh title="CLI command example"
    
  oint notion UserList --token "secret_9RsfMrRMqZwqp0Zl0B..."

```

```json title="Result"

```
