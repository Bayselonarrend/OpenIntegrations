---
sidebar_position: 2
---

# Return block.



*Function ReturnBlock(Val Token, Val BlockID, Val OnlyBase = True) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | BlockID | --block | String | Block ID |
 | OnlyBase | --core | Boolean | True > service fields are deleted, only the block itself remains |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Block = "ca18df269bd24407852b91c30...";
 
 Response = OPI_Notion.ReturnBlock(Token, BlockID);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint notion ReturnBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block% --core %core%


```


```json title="Result"

{
 "request_id": "031886cc-537d-4025-b480-ecfdc9f2870c",
 "to_do": {
 "color": "default",
 "checked": false,
 "rich_text": [
 {
 "plain_text": "Hello",
 "annotations": {
 "color": "default",
 "code": false,
 "underline": false,
 "strikethrough": false,
 "italic": false,
 "bold": false
 },
 "text": {
 "link": null,
 "content": "Hello"
 },
 "href": null,
 "type": "text"
 }
 ]
 },
 "type": "to_do",
 "archived": true,
 "created_by": {
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T19:43:00.000Z",
 "created_time": "2024-01-26T11:03:00.000Z",
 "has_children": false,
 "parent": {
 "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
 "type": "page_id"
 },
 "last_edited_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "id": "d7021bdd-15b9-44ab-abcb-02bd2b1a5f6a",
 "object": "block"
 }

```
