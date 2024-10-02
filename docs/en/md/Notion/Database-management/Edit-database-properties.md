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
 "id": "11382aa7-fc4e-8170-ba7a-f122b5cdcdd7",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-02T14:42:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-02T14:42:00Z",
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
  "Description": {
   "id": "CYRq",
   "name": "Description",
   "type": "rich_text",
   "rich_text": {}
  },
  "Number": {
   "id": "DETZ",
   "name": "Number",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Image": {
   "id": "GD%7DC",
   "name": "Image",
   "type": "files",
   "files": {}
  },
  "User": {
   "id": "GwNr",
   "name": "User",
   "type": "people",
   "people": {}
  },
  "CreationDate": {
   "id": "VFhd",
   "name": "CreationDate",
   "type": "date",
   "date": {}
  },
  "Status": {
   "id": "%60%5Bb%3A",
   "name": "Status",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "c96a1cb7-b2de-4272-a597-56a0c8721814",
      "name": "New",
      "color": "green",
      "description": null
     },
     {
      "id": "ad41d521-9aba-4b7d-beaa-56370095b0a6",
      "name": "InProgress",
      "color": "yellow",
      "description": null
     },
     {
      "id": "053b15a8-9caf-4a5a-867e-17b9bdc31211",
      "name": "Remote",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Active": {
   "id": "fg~%7C",
   "name": "Active",
   "type": "checkbox",
   "checkbox": {}
  },
  "Phone": {
   "id": "rvYX",
   "name": "Phone",
   "type": "phone_number",
   "phone_number": {}
  },
  "Email": {
   "id": "tocN",
   "name": "Email",
   "type": "rich_text",
   "rich_text": {}
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
 "url": "https://www.notion.so/11382aa7fc4e8170ba7af122b5cdcdd7",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "237d4248-7c32-43e4-a7f4-b144860ebf9c"
}
```
