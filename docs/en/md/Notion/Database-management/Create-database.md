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
  
  Token = "secret_9RsfMrRMqZwqp0Zl0B...";
  Parent = "5dd94c34fab04bff9...";
  Title = "This base is from 1C";
  
  Properties = New Map;
  Properties.Insert("Name", "title"); //Title field required
  Properties.Insert("Description", "rich_text");
  Properties.Insert("Number", "number");
  Properties.Insert("Status", "status");
  Properties.Insert("CreationDate", "date");
  Properties.Insert("Image", "files");
  Properties.Insert("Active", "checkbox");
  Properties.Insert("Website", "url");
  Properties.Insert("Email", "email");
  Properties.Insert("Phone", "phone_number");
  Properties.Insert("User", "people");
  
  ValueSelection = New Map;
  ValueSelection.Insert("New", "green");
  ValueSelection.Insert("InProgress", "yellow");
  ValueSelection.Insert("Remote", "red");
  Properties.Insert("Status", ValueSelection);
  
  Response = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties);
  Response = OPI_Tools.JSONString(Response);
```



```sh title="CLI command example"
    
  oint notion CreateDatabase --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --title "This base is from 1C" --props %props%

```

```json title="Result"
  {
  "request_id": "43adcae7-c8ee-4a7d-aba6-c2c43ad2c33b",
  "public_url": null,
  "url": "https://www.notion.so/048ba0ce4f474e33900540d249b01949",
  "parent": {
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77",
  "type": "page_id"
  },
  "properties": {
  "Image": {
  "files": {},
  "type": "files",
  "name": "Image",
  "id": "r%3Dfa"
  },
  "Active": {
  "checkbox": {},
  "type": "checkbox",
  "name": "Active",
  "id": "q%3FQF"
  },
  "Phone": {
  "phone_number": {},
  "type": "phone_number",
  "name": "Phone",
  "id": "hDII"
  },
  "User": {
  "people": {},
  "type": "people",
  "name": "User",
  "id": "%5D%40Md"
  },
  "Website": {
  "url": {},
  "type": "url",
  "name": "Website",
  "id": "THre"
  },
  "Description": {
  "rich_text": {},
  "type": "rich_text",
  "name": "Description",
  "id": "KnG%3F"
  },
  "Status": {
  "select": {
  "options": [
  {
  "description": null,
  "color": "red",
  "name": "Remote",
  "id": "a71d6e8a-4f3e-4dfd-9f0e-4d90e400fde7"
  },
  {
  "description": null,
  "color": "yellow",
  "name": "InProgress",
  "id": "aa6300b4-c635-4ab4-b5cd-87d14e45dd11"
  },
  {
  "description": null,
  "color": "green",
  "name": "New",
  "id": "202b1d30-2095-40f1-8b91-f627d475d560"
  }
  ]
  },
  "type": "select",
  "name": "Status",
  "id": "IDW%3C"
  },
  "Number": {
  "type": "number",
  "name": "Number",
  "number": {
  "format": "number"
  },
  "id": "CH__"
  },
  "CreationDate": {
  "date": {},
  "type": "date",
  "name": "CreationDate",
  "id": "BQN%5B"
  },
  "Name": {
  "title": {},
  "type": "title",
  "name": "Name",
  "id": "title"
  },
  "Email": {
  "email": {},
  "type": "email",
  "name": "Email",
  "id": "%3CO%3AD"
  }
  },
  "last_edited_time": "2024-01-26T16:49:00.000Z",
  "description": [],
  "created_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "archived": false,
  "icon": null,
  "created_time": "2024-01-26T16:49:00.000Z",
  "title": [
  {
  "plain_text": "This base is from 1C",
  "annotations": {
  "color": "default",
  "code": false,
  "underline": false,
  "strikethrough": false,
  "italic": false,
  "bold": false
  },
  "text": {
  "link": null,
  "content": "This base is from 1C"
  },
  "href": null,
  "type": "text"
  }
  ],
  "cover": null,
  "is_inline": false,
  "id": "048ba0ce-4f47-4e33-9005-40d249b01949",
  "last_edited_by": {
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
  "object": "user"
  },
  "object": "database"
  }

```
