---
sidebar_position: 1
---

# Create page
 Creates a child page above another parent page



`Function CreatePage(Val Token, Val Parent, Val Title) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --page | String | Parent ID |
  | Title | --title | String | Page title |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Parent = "5dd94c34fab04bff986b7511c0779f77";
    Title  = "TestTitle";

    Result = OPI_Notion.CreatePage(Token, Parent, Title);
```



```sh title="CLI command example"
    
  oint notion CreatePage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "Created by 1C"

```

```json title="Result"
{
 "object": "page",
 "id": "11882aa7-fc4e-8164-8fa3-d0368cd20de0",
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
 "cover": null,
 "icon": null,
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "title": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "title",
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
     "plain_text": "title",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/title-11882aa7fc4e81648fa3d0368cd20de0",
 "public_url": null,
 "request_id": "1cfb0863-c2ac-46c3-8ca1-f6a3a93dcf14"
}
```
