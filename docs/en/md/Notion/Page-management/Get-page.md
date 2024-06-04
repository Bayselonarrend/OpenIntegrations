---
sidebar_position: 3
---

# Get page
 Gets information about the page by ID


*Function GetPage(Val Token, Val Page) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Page | --page | String | Page ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Notion

```bsl title="Code example"
	
 
 Token = "secret_9RsfMrRMqZwqp0Zl0B...";
 Page = "a574281614174169bf55dbae4...";
 
 Response = OPI_Notion.GetPage(Token, Page);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint notion GetPage --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "a574281614174169bf55dbae4..."

```


```json title="Result"

{
 "request_id": "61eaaa91-41fc-4523-a445-602805afb281",
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
 "checkbox": false,
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
 "plain_text": "vector@mail.ru",
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
 "content": "vector@mail.ru"
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
 "cover": {
 "external": {
 "url": "https://opi.neocities.org/assets/images/logo_long-e69f28017feff1759ffcfe3f4e7bbf2a.png"
 },
 "type": "external"
 },
 "archived": false,
 "created_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "last_edited_time": "2024-01-26T19:30:00.000Z",
 "icon": {
 "external": {
 "url": "https://opi.neocities.org/img/logo.png"
 },
 "type": "external"
 },
 "created_time": "2024-01-26T18:45:00.000Z",
 "last_edited_by": {
 "id": "8b07422e-eeea-40d1-8d5e-c784211825b0",
 "object": "user"
 },
 "id": "a5742816-1417-4169-bf55-dbae44f46d9c",
 "object": "page"
 }

```
