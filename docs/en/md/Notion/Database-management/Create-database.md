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
 "id": "11382aa7-fc4e-8188-a667-cf61d6416ad7",
 "cover": null,
 "icon": null,
 "created_time": "2024-10-02T06:40:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_time": "2024-10-02T06:40:00Z",
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
  "CreationDate": {
   "id": "%3DZo%60",
   "name": "CreationDate",
   "type": "date",
   "date": {}
  },
  "User": {
   "id": "Hka%5B",
   "name": "User",
   "type": "people",
   "people": {}
  },
  "Phone": {
   "id": "PsH%60",
   "name": "Phone",
   "type": "phone_number",
   "phone_number": {}
  },
  "Email": {
   "id": "_eKE",
   "name": "Email",
   "type": "email",
   "email": {}
  },
  "Website": {
   "id": "%60Qcf",
   "name": "Website",
   "type": "url",
   "url": {}
  },
  "Number": {
   "id": "bph%3E",
   "name": "Number",
   "type": "number",
   "number": {
    "format": "number"
   }
  },
  "Description": {
   "id": "eP%5EC",
   "name": "Description",
   "type": "rich_text",
   "rich_text": {}
  },
  "Active": {
   "id": "jdgZ",
   "name": "Active",
   "type": "checkbox",
   "checkbox": {}
  },
  "Image": {
   "id": "or%40%3B",
   "name": "Image",
   "type": "files",
   "files": {}
  },
  "Status": {
   "id": "%7DoCT",
   "name": "Status",
   "type": "select",
   "select": {
    "options": [
     {
      "id": "d9f310fb-e640-4791-989f-cc805e45c2fc",
      "name": "New",
      "color": "green",
      "description": null
     },
     {
      "id": "f23002ab-9ef3-439c-a70c-451aaba10c96",
      "name": "InProgress",
      "color": "yellow",
      "description": null
     },
     {
      "id": "f9c45eac-4200-4298-a3d4-350073b55429",
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
 "url": "https://www.notion.so/11382aa7fc4e8188a667cf61d6416ad7",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "46371134-5b35-4084-bd74-cf5678ff77c7"
}
```
