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
 "description": [],
 "is_inline": false,
 "properties": {
  "Website": {
   "id": "%3C~B%40",
   "name": "Website",
   "type": "url",
   "url": {}
  },
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
   "type": "email",
   "email": {}
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
 "request_id": "f8c6fdd0-64df-4822-9677-5a5ca3422f81"
}
```
