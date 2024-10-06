---
sidebar_position: 3
---

# Edit database properties
 Edits properties of an existing database



`Function EditDatabaseProperties(Val Token, Val Base, Val Properties = "", Val Title = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Base | --base | String | Target database ID |
  | Properties | --props | Map of KeyAndValue | New or modified database properties |
  | Title | --title | String | New database title |
  | Description | --description | String | New database description |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token = "secret_9RsfMrRMqZwqp0Zl0B...";
    Base  = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);
```



```sh title="CLI command example"
    
  oint notion EditDatabaseProperties --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --props %props% --title "Updated title" --description "Updated base description"

```

```json title="Result"
{
 "object": "database",
 "id": "11682aa7-fc4e-81c3-8fd1-d37ac3ba1753",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-05T15:00:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-05T15:00:00Z",
 "title": [
  {
   "type": "text",
   "text": {
    "content": "TestTitle",
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
   "plain_text": "TestTitle",
   "href": null
  }
 ],
 "description": [
  {
   "type": "text",
   "text": {
    "content": "TestDescription",
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
   "plain_text": "TestDescription",
   "href": null
  }
 ],
 "is_inline": false,
 "properties": {
  "Active": {
   "id": "%3A%7CmJ",
   "name": "Active",
   "type": "checkbox",
   "checkbox": {}
  },
  "User": {
   "id": "KEwF",
   "name": "User",
   "type": "people",
   "people": {}
  },
  "CreationDate": {
   "id": "KYy%40",
   "name": "CreationDate",
   "type": "date",
   "date": {}
  },
  "Image": {
   "id": "KlBb",
   "name": "Image",
   "type": "files",
   "files": {}
  },
  "Phone": {
   "id": "Mn%40p",
   "name": "Phone",
   "type": "phone_number",
   "phone_number": {}
  },
  "Number": {
   "id": "s%5DAT",
   "name": "Number",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Description": {
   "id": "t%3A%3BO",
   "name": "Description",
   "type": "rich_text",
   "rich_text": {}
  },
  "Email": {
   "id": "u~I%3E",
   "name": "Email",
   "type": "rich_text",
   "rich_text": {}
  },
  "Status": {
   "id": "vQA%5C",
   "name": "Status",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "8692b38e-14c8-45b8-93f7-052193de1c9f",
      "name": "New",
      "color": "green",
      "description": null
     },
     {
      "id": "896c91b1-1e18-4e01-b8cc-3677cbd658c5",
      "name": "InProgress",
      "color": "yellow",
      "description": null
     },
     {
      "id": "1ea22363-d54a-437c-8228-f570440dc8d1",
      "name": "Remote",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Name": {
   "id": "title",
   "name": "Name",
   "type": "title",
   "title": {}
  }
 },
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "url": "https://www.notion.so/11682aa7fc4e81c38fd1d37ac3ba1753",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "32e0996a-d488-4e41-b51a-0f152baf0ffa"
}
```
