---
sidebar_position: 3
---

# Return child blocks
 Returns list of child blocks of parent block



`Function ReturnChildBlocks(Val Token, Val BlockID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | BlockID | --block | String | Parent block ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Block = "11282aa7-fc4e-8108-ad2f-ed75fb53373d";

    Result = OPI_Notion.ReturnChildBlocks(Token, Block);
```



```sh title="CLI command example"
    
  oint notion ReturnChildBlocks --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%

```

```json title="Result"
{
 "object": "list",
 "results": [],
 "next_cursor": null,
 "has_more": false,
 "type": "block",
 "block": {},
 "request_id": "4b9cfaf8-0a0c-4dee-a88b-e6f73136df17"
}
```
