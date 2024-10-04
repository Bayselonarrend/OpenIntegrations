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
 "id": "11382aa7-fc4e-8111-8c9c-c95233f33eca",
 "created_time": "2024-10-02T14:42:00Z",
 "last_edited_time": "2024-10-02T14:42:00Z",
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
  "database_id": "11382aa7-fc4e-8170-ba7a-f122b5cdcdd7"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Description": {
   "id": "CYRq",
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
  "Number": {
   "id": "DETZ",
   "type": "number",
   "number": 1
  },
  "Image": {
   "id": "GD%7DC",
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
  "User": {
   "id": "GwNr",
   "type": "people",
   "people": []
  },
  "CreationDate": {
   "id": "VFhd",
   "type": "date",
   "date": {
    "start": "2024-10-02T08:42:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Status": {
   "id": "%60%5Bb%3A",
   "type": "select",
   "select": {
    "id": "c96a1cb7-b2de-4272-a597-56a0c8721814",
    "name": "New",
    "color": "green"
   }
  },
  "Active": {
   "id": "fg~%7C",
   "type": "checkbox",
   "checkbox": true
  },
  "Phone": {
   "id": "rvYX",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Email": {
   "id": "tocN",
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
 "url": "https://www.notion.so/LLC-Vector-11382aa7fc4e81118c9cc95233f33eca",
 "public_url": null,
 "request_id": "f5a69972-4d49-4a39-a171-6512e1e225c8"
}
```
