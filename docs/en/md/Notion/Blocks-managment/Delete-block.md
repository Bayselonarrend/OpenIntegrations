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
{
 "object": "block",
 "id": "11882aa7-fc4e-8183-a9c4-f657d587eec6",
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "created_time": "2024-10-07T19:20:00Z",
 "last_edited_time": "2024-10-07T19:20:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "has_children": false,
 "archived": true,
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
 },
 "request_id": "f7781034-43ec-4fa7-ba72-72eaaafdcb96"
}
```
