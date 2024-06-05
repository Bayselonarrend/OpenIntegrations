---
sidebar_position: 1
---

# Create block
 Creates a new block based on an existing block


*Function CreateBlock(Val Token, Val Parent, Val Block, Val InsertAfter = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Parent | --page | String | Parent block or page ID |
 | Block | --block | String, Map Of KeyAndValue | Block ID or block sample itself |
 | InsertAfter | --prev | String | Block ID after which to insert the new one |

 
 Returns: Key-Value Pair - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Parent = "5dd94c34fab04bff9...";
 
 Block = OPI_Notion.ReturnBlock(Token, "ca18df269bd24407852b91c30e..."); //Block as map. Can be changed.
 
 Response = OPI_Notion.CreateBlock(Token, Parent, Block); 
 Response = OPI_Notion.CreateBlock(Token, Parent, "46c1500ed40c4e89ba6a229003..."); 
 Response = OPI_Notion.CreateBlock(Token, Parent, "aa4137d4c8cc445d9f969c3968..."); 
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint notion CreateBlock --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --block %block% --prev %prev%


```


```json title="Result"

{
 "request_id": "4de46f5b-d38b-4df5-b26e-32127db1096b",
 "block": {},
 "type": "block",
 "has_more": false,
 "next_cursor": null,
 "results": [
 {
 "type": "numbered_list_item",
 "archived": false,
 "created_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T17:11:00.000Z",
 "created_time": "2024-01-26T17:11:00.000Z",
 "has_children": false,
 "parent": {
 "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
 "type": "page_id"
 },
 "last_edited_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "id": "b147fabd-53ea-42d5-bd23-85968f627f88",
 "numbered_list_item": {
 "color": "default",
 "rich_text": [
 {
 "plain_text": "Description",
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
 "content": "Description"
 },
 "href": null,
 "type": "text"
 }
 ]
 },
 "object": "block"
 }
 ],
 "object": "list"
 }

```
