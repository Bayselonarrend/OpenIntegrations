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

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

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
 "id": "11a82aa7-fc4e-8198-ad23-eeb2e6ea678f",
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
 "url": "https://www.notion.so/title-11a82aa7fc4e8198ad23eeb2e6ea678f",
 "public_url": null,
 "request_id": "17934ae2-309f-4eb5-9123-bd100ad5a559"
}
```
