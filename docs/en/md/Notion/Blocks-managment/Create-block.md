﻿---
sidebar_position: 1
---

# Create block
 Creates a new block based on an existing block



`Function CreateBlock(Val Token, Val Parent, Val Block, Val InsertAfter = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --page | String | Parent block or page ID |
  | Block | --block | String, Map Of KeyAndValue | Block ID or block sample itself |
  | InsertAfter | --prev | String | Block ID after which to insert the new one |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Parent = "5dd94c34fab04bff986b7511c0779f77";
    Block  = "d7021bdd15b944ababcb02bd2b1a5f6a";

    BlockData = OPI_Notion.ReturnBlock(Token, Block);
    Result    = OPI_Notion.CreateBlock(Token, Parent, BlockData);
```



```sh title="CLI command example"
    
  oint notion CreateBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --block %block% --prev %prev%

```

```json title="Result"
{
 "object": "list",
 "results": [
  {
   "object": "block",
   "id": "11a82aa7-fc4e-817b-994e-c3d1a6fadf1b",
   "parent": {
    "type": "page_id",
    "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
   },
   "created_time": "2024-10-09T06:14:00Z",
   "last_edited_time": "2024-10-09T06:14:00Z",
   "created_by": {
    "object": "user",
    "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
   },
   "last_edited_by": {
    "object": "user",
    "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
   },
   "has_children": false,
   "archived": false,
   "in_trash": false,
   "type": "to_do",
   "to_do": {
    "rich_text": [
     {
      "type": "text",
      "text": {
       "content": "YoYO",
       "link": null
      },
      "annotations": {
       "bold": false,
       "italic": false,
       "strikethrough": false,
       "underline": false,
       "code": false,
       "color": "default"
      },
      "plain_text": "YoYO",
      "href": null
     }
    ],
    "checked": false,
    "color": "default"
   }
  }
 ],
 "next_cursor": null,
 "has_more": false,
 "type": "block",
 "block": {},
 "request_id": "f8c21aa2-8ec9-41a8-9bfe-d447541b32e1"
}
```
