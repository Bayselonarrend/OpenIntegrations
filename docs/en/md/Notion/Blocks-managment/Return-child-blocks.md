---
sidebar_position: 3
---

# Return child blocks
 Returns list of child blocks of parent block


*Function ReturnChildBlocks(Val Token, Val BlockID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | BlockID | --block | String | Parent block ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Block = "46c1500ed40c4e89ba6a22900...";
 
 Response = OPI_Notion.ReturnChildBlocks(Token, BlockID);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint notion ReturnChildBlocks --token "secret_9RsfMrRMqZwqp0Zl0B..." --block %block%


```


```json title="Result"

{
 "request_id": "fea2a37b-5507-451d-a4be-14433811a69e",
 "block": {},
 "type": "block",
 "has_more": false,
 "next_cursor": null,
 "results": [
 {
 "type": "numbered_list_item",
 "archived": false,
 "created_by": {
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T20:33:00.000Z",
 "created_time": "2024-01-26T17:02:00.000Z",
 "has_children": false,
 "parent": {
 "block_id": "46c1500e-d40c-4e89-ba6a-229003d81ded",
 "type": "block_id"
 },
 "last_edited_by": {
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "object": "user"
 },
 "id": "aa4137d4-c8cc-445d-9f96-9c3968334e74",
 "numbered_list_item": {
 "color": "default",
 "rich_text": [
 {
 "plain_text": "Two",
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
 "content": "Two"
 },
 "href": null,
 "type": "text"
 }
 ]
 },
 "object": "block"
 },
 {
 "type": "numbered_list_item",
 "archived": false,
 "created_by": {
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T20:33:00.000Z",
 "created_time": "2024-01-26T20:30:00.000Z",
 "has_children": false,
 "parent": {
 "block_id": "46c1500e-d40c-4e89-ba6a-229003d81ded",
 "type": "block_id"
 },
 "last_edited_by": {
 "id": "ed71865a-9891-46bc-86cd-a92aa499cfdb",
 "object": "user"
 },
 "id": "6fb45895-0350-49d3-a5c7-e0cb1e24061e",
 "numbered_list_item": {
 "color": "default",
 "rich_text": [
 {
 "plain_text": "Three",
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
 "content": "Three"
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
