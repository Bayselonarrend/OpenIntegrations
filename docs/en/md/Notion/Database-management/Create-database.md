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
 "description": [],
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
   "type": "email",
   "email": {}
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
  "Website": {
   "id": "%7DbXq",
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
 "url": "https://www.notion.so/11682aa7fc4e81c38fd1d37ac3ba1753",
 "public_url": null,
 "archived": false,
 "in_trash": false,
 "request_id": "c09590dc-7207-4131-a11b-4c6d3342d69a"
}
```
