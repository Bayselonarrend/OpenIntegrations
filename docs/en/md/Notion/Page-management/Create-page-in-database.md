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
 "id": "11682aa7-fc4e-81fc-a85c-c5bf07cf7c08",
 "created_time": "2024-10-05T15:00:00Z",
 "last_edited_time": "2024-10-05T15:00:00Z",
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
  "database_id": "11682aa7-fc4e-81c3-8fd1-d37ac3ba1753"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Active": {
   "id": "%3A%7CmJ",
   "type": "checkbox",
   "checkbox": true
  },
  "User": {
   "id": "KEwF",
   "type": "people",
   "people": []
  },
  "CreationDate": {
   "id": "KYy%40",
   "type": "date",
   "date": {
    "start": "2024-10-05T09:00:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Image": {
   "id": "KlBb",
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
  "Phone": {
   "id": "Mn%40p",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "Number": {
   "id": "s%5DAT",
   "type": "number",
   "number": 1
  },
  "Description": {
   "id": "t%3A%3BO",
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
  "Email": {
   "id": "u~I%3E",
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
  "Status": {
   "id": "vQA%5C",
   "type": "select",
   "select": {
    "id": "8692b38e-14c8-45b8-93f7-052193de1c9f",
    "name": "New",
    "color": "green"
   }
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
 "url": "https://www.notion.so/LLC-Vector-11682aa7fc4e81fca85cc5bf07cf7c08",
 "public_url": null,
 "request_id": "4ffc996b-6eee-45ec-a878-aa057b06b735"
}
```
