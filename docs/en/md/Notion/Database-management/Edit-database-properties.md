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
 "id": "11882aa7-fc4e-8171-8ab2-e7ec4b6fbd0f",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-07T19:20:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-07T19:20:00Z",
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
  "Phone": {
   "id": "%3C%5Ehm",
   "name": "Phone",
   "type": "phone_number",
   "phone_number": {}
  },
  "CreationDate": {
   "id": "Oykw",
   "name": "CreationDate",
   "type": "date",
   "date": {}
  },
  "Description": {
   "id": "Q~%3DG",
   "name": "Description",
   "type": "rich_text",
   "rich_text": {}
  },
  "Status": {
   "id": "%5DPli",
   "name": "Status",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "b037c74f-15fa-4d57-ac22-2c0baec6c33e",
      "name": "New",
      "color": "green",
      "description": null
     },
     {
      "id": "0627e1c9-a1e2-47fb-bc45-81f62561194b",
      "name": "InProgress",
      "color": "yellow",
      "description": null
     },
     {
      "id": "0dbe331e-6233-4f41-a290-fb5383d09d02",
      "name": "Remote",
      "color": "red",
      "description": null
     }
    ]
   }
  },
  "Email": {
   "id": "%5DoSt",
   "name": "Email",
   "type": "rich_text",
   "rich_text": {}
  },
  "Number": {
   "id": "aPBW",
   "name": "Number",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "User": {
   "id": "dNc%7B",
   "name": "User",
   "type": "people",
   "people": {}
  },
  "Active": {
   "id": "l%5EwE",
   "name": "Active",
   "type": "checkbox",
   "checkbox": {}
  },
  "Image": {
   "id": "tK_b",
   "name": "Image",
   "type": "files",
   "files": {}
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
 "url": "https://www.notion.so/11882aa7fc4e81718ab2e7ec4b6fbd0f",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "856a706c-2094-4c49-a0c6-58872c6f3311"
}
```
