---
sidebar_position: 2
---

# Get database
 Get database information



`Function GetDatabase(Val Token, Val Base) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Database ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Base  = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";

    Result = OPI_Notion.GetDatabase(Token, Base);
```



```sh title="CLI command example"
    
  oint notion GetDatabase --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "048ba0ce4f474e33900540d24..."

```

```json title="Result"

```
