---
sidebar_position: 2
---

# Return block
 Returns the block structure by ID



`Function ReturnBlock(Val Token, Val BlockID, Val OnlyBase = True) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | BlockID | --block | String | Block ID |
  | OnlyBase | --core | Boolean | True > service fields are deleted, only the block itself remains |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Block = "d7021bdd15b944ababcb02bd2b1a5f6a";

    Result = OPI_Notion.ReturnBlock(Token, Block);
```
 



```json title="Result"
{
 "object": "block",
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "in_trash": true,
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
```
