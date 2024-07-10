---
sidebar_position: 1
---

# Create page
 Creates a child page above another parent page


<br/>


`Function CreatePage(Val Token, Val Parent, Val Title) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Parent | --page | String | Parent ID |
 | Title | --title | String | Page title |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Parent = "5dd94c34fab04bff9...";
 Title = "Created by 1C";
 
 Response = OPI_Notion.CreatePage(Token, Parent, Title);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint notion CreatePage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Created by 1C"

```

```json title="Result"
{
 "request_id": "f145f634-ea3a-4f74-b079-f365ecbcf583",
 "public_url": null,
 "url": "https://www.notion.so/1-4392f919813c4c8d84017d973bddaabf",
 "properties": {
 "title": {
 "title": [
 {
 "plain_text": "Created by 1C",
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
 "content": "Created by 1C"
 },
 "href": null,
 "type": "text"
 }
 ],
 "type": "title",
 "id": "title"
 }
 },
 "parent": {
 "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
 "type": "page_id"
 },
 "cover": null,
 "archived": false,
 "created_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T17:20:00.000Z",
 "icon": null,
 "created_time": "2024-01-26T17:20:00.000Z",
 "last_edited_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "id": "4392f919-813c-4c8d-8401-7d973bddaabf",
 "object": "page"
 }
```
