---
sidebar_position: 1
---

# Create database
 Creates a database



`Function CreateDatabase(Val Token, Val Parent, Val Title, Val Properties = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --page | String | Parent page ID |
  | Title | --title | String | Database title |
  | Properties | --props | Structure Of String | Database properties |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Parent = "5dd94c34fab04bff986b7511c0779f77";
    Title  = "TestTitle";

    Properties = New Map;
    Properties.Insert("Name"         , "title");
    Properties.Insert("Description"  , "rich_text");
    Properties.Insert("Number"       , "number");
    Properties.Insert("Status"       , "status");
    Properties.Insert("CreationDate" , "date");
    Properties.Insert("Image"        , "files");
    Properties.Insert("Active"       , "checkbox");
    Properties.Insert("Website"      , "url");
    Properties.Insert("Email"        , "email");
    Properties.Insert("Phone"        , "phone_number");
    Properties.Insert("User"         , "people");

    ValueSelection = New Map;
    ValueSelection.Insert("New"        , "green");
    ValueSelection.Insert("InProgress" , "yellow");
    ValueSelection.Insert("Remote"     , "red");

    Properties.Insert("Status", ValueSelection);

    Result = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties);
```



```sh title="CLI command example"
    
  oint notion CreateDatabase --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "This base is from 1C" --props %props%

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
 "description": [],
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
   "type": "email",
   "email": {}
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
  "Website": {
   "id": "uil%3C",
   "name": "Website",
   "type": "url",
   "url": {}
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
 "request_id": "8d5e4c4d-5e06-420e-8bee-5e86d1d458d9"
}
```
