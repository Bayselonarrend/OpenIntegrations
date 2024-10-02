---
sidebar_position: 3
---

# Get page
 Gets information about the page by ID



`Function GetPage(Val Token, Val Page) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Page | --page | String | Page ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Page  = "11282aa7-fc4e-814c-990c-dd3c9c3c2c22";

    Result = OPI_Notion.GetPage(Token, Page);
```



```sh title="CLI command example"
    
  oint notion GetPage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "a574281614174169bf55dbae4..."

```

```json title="Result"
{
 "object": "page",
 "id": "11382aa7-fc4e-819a-80d4-feb525be9b58",
 "created_time": "2024-10-02T14:42:00Z",
 "last_edited_time": "2024-10-02T14:42:00Z",
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
 "url": "https://www.notion.so/title-11382aa7fc4e819a80d4feb525be9b58",
 "public_url": null,
 "request_id": "e5792d90-74a0-451a-8800-3941a511c031"
}
```
