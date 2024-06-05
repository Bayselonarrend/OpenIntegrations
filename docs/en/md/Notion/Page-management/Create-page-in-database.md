---
sidebar_position: 2
---

# Create page in database
 Creates a page in the parent database


*Function CreatePageInDatabase(Val Token, Val Parent, Val Data) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Parent | --base | String | Parent database ID |
 | Data | --data | Key-Value Pair | Properties match |

 
 Returns: Key-Value Pair - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Parent = "5dd94c34fab04bff9...";
 Image = New Map;
 Image.Insert("Logo", "https://pricep-farkop.ru/wp-content/uploads/2017/02/17.jpg");
 
 Data = New Map;
 Data.Insert("Name", "LLC Vector");
 Data.Insert("Description", "OurFirstClient");
 Data.Insert("Number", 1);
 Data.Insert("Status", "Regular");
 Data.Insert("CreationDate", CurrentSessionDate());
 Data.Insert("Image", Image);
 Data.Insert("Active", True);
 Data.Insert("Email", "mail@vector.ru");
 Data.Insert("Phone", "88005553535");
 Data.Insert("Status", "New");
 
 Response = OPI_Notion.CreatePageInDatabase(Token, Base, Data);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint notion CreatePageInDatabase --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --data %data%


```


```json title="Result"

{
 "request_id": "03fd3bd2-6dd1-4ca2-bf85-9233748a745f",
 "public_url": null,
 "url": "https://www.notion.so/a574281614174169bf55dbae44f46d9c",
 "properties": {
 "Image": {
 "files": [
 {
 "external": {
 "url": "https://pricep-farkop.ru/wp-content/uploads/2017/02/17.jpg"
 },
 "type": "external",
 "name": "Logo"
 }
 ],
 "type": "files",
 "id": "r%3Dfa"
 },
 "Active": {
 "checkbox": true,
 "type": "checkbox",
 "id": "q%3FQF"
 },
 "Phone": {
 "phone_number": "88005553535",
 "type": "phone_number",
 "id": "hDII"
 },
 "User": {
 "people": [],
 "type": "people",
 "id": "%5D%40Md"
 },
 "Description": {
 "rich_text": [
 {
 "plain_text": "OurFirstClient",
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
 "content": "OurFirstClient"
 },
 "href": null,
 "type": "text"
 }
 ],
 "type": "rich_text",
 "id": "KnG%3F"
 },
 "Status": {
 "select": {
 "color": "green",
 "name": "New",
 "id": "202b1d30-2095-40f1-8b91-f627d475d560"
 },
 "type": "select",
 "id": "IDW%3C"
 },
 "Number": {
 "type": "number",
 "number": 1,
 "id": "CH__"
 },
 "CreationDate": {
 "date": {
 "time_zone": null,
 "end": null,
 "start": "2024-01-26T09:45:00.000+00:00"
 },
 "type": "date",
 "id": "BQN%5B"
 },
 "Name": {
 "title": [
 {
 "plain_text": "LLC Vector",
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
 "content": "LLC Vector"
 },
 "href": null,
 "type": "text"
 }
 ],
 "type": "title",
 "id": "title"
 },
 "Email": {
 "rich_text": [
 {
 "plain_text": "mail@vector.ru",
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
 "content": "mail@vector.ru"
 },
 "href": null,
 "type": "text"
 }
 ],
 "type": "rich_text",
 "id": "%3CO%3AD"
 }
 },
 "parent": {
 "database_id": "048ba0ce-4f47-4e33-9005-40d249b01949",
 "type": "database_id"
 },
 "cover": null,
 "archived": false,
 "created_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T18:45:00.000Z",
 "icon": null,
 "created_time": "2024-01-26T18:45:00.000Z",
 "last_edited_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "id": "a5742816-1417-4169-bf55-dbae44f46d9c",
 "object": "page"
 }

```
