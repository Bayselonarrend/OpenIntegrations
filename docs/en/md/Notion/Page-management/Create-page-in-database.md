---
sidebar_position: 2
---

# Create page in database
 Creates a page in the parent database



`Function CreatePageInDatabase(Val Token, Val Parent, Val Data) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Parent | --base | String | Parent database ID |
  | Data | --data | Map Of KeyAndValue | Properties map |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Base   = "11282aa7-fc4e-810b-ab77-cef5a2a3443e";
    Image_ = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Binary Data or Path to file

    Image = New Map;
    Image.Insert("Logo", Image_);

    Properties = New Map;
    Properties.Insert("Name"         , "LLC Vector");
    Properties.Insert("Description"  , "OurFirstClient");
    Properties.Insert("Number"       , 1);
    Properties.Insert("Status"       , "Regular");
    Properties.Insert("CreationDate" , OPI_Tools.GetCurrentDate());
    Properties.Insert("Image"        , Image);
    Properties.Insert("Active"       , True);
    Properties.Insert("Website"      , "https://vector.ru");
    Properties.Insert("Email"        , "mail@vector.ru");
    Properties.Insert("Phone"        , "88005553535");
    Properties.Insert("Status"       , "New");

    Result = OPI_Notion.CreatePageInDatabase(Token, Base, Properties);
```



```sh title="CLI command example"
    
  oint notion CreatePageInDatabase --token "secret_9RsfMrRMqZwqp0Zl0B..." --base "5dd94c34fab04bff9..." --data %data%

```

```json title="Result"
{
 "object": "page",
 "id": "11882aa7-fc4e-81dd-916b-f1ec1f1a9447",
 "created_time": "2024-10-07T19:20:00Z",
 "last_edited_time": "2024-10-07T19:20:00Z",
 "created_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "last_edited_by": {
  "object": "user",
  "id": "8b07422e-eeea-40d1-8d5e-c784211825b0"
 },
 "cover": null,
 "icon": null,
 "parent": {
  "type": "database_id",
  "database_id": "11882aa7-fc4e-8171-8ab2-e7ec4b6fbd0f"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Phone": {
   "id": "%3C%5Ehm",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "CreationDate": {
   "id": "Oykw",
   "type": "date",
   "date": {
    "start": "2024-10-07T13:20:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Description": {
   "id": "Q~%3DG",
   "type": "rich_text",
   "rich_text": [
    {
     "type": "text",
     "text": {
      "content": "OurFirstClient",
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
     "plain_text": "OurFirstClient",
     "href": null
    }
   ]
  },
  "Status": {
   "id": "%5DPli",
   "type": "select",
   "select": {
    "id": "b037c74f-15fa-4d57-ac22-2c0baec6c33e",
    "name": "New",
    "color": "green"
   }
  },
  "Email": {
   "id": "%5DoSt",
   "type": "rich_text",
   "rich_text": [
    {
     "type": "text",
     "text": {
      "content": "mail@vector.ru",
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
     "plain_text": "mail@vector.ru",
     "href": null
    }
   ]
  },
  "Number": {
   "id": "aPBW",
   "type": "number",
   "number": 1
  },
  "User": {
   "id": "dNc%7B",
   "type": "people",
   "people": []
  },
  "Active": {
   "id": "l%5EwE",
   "type": "checkbox",
   "checkbox": true
  },
  "Image": {
   "id": "tK_b",
   "type": "files",
   "files": [
    {
     "name": "Logo",
     "type": "external",
     "external": {
      "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"
     }
    }
   ]
  },
  "Name": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "LLC Vector",
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
     "plain_text": "LLC Vector",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/LLC-Vector-11882aa7fc4e81dd916bf1ec1f1a9447",
 "public_url": null,
 "request_id": "dac65314-0f14-491a-967e-9e4df6dfdf11"
}
```
