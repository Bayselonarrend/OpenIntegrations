---
sidebar_position: 4
---

# Delete block
 Deletes block by ID



`Function DeleteBlock(Val Token, Val BlockID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | BlockID | --block | String | Block ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Block = "11282aa7-fc4e-8108-ad2f-ed75fb53373d";

    Result = OPI_Notion.DeleteBlock(Token, Block);
```



```sh title="CLI command example"
    
  oint notion DeleteBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%

```

```json title="Result"

```
