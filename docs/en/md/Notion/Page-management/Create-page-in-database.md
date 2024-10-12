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

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token  = "secret_9RsfMrRMqZwqp0Zl0B...";
    Base   = "11d82aa7-fc4e-8164-a78a-d4f750eb6066";
    Image_ = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL, Binary Data or Path to file

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
 "id": "11a82aa7-fc4e-8196-95c5-d8db91cb3fb1",
 "created_time": "2024-10-09T06:14:00Z",
 "last_edited_time": "2024-10-09T06:14:00Z",
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
  "database_id": "11a82aa7-fc4e-8138-a724-ee8786147d82"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "Description": {
   "id": "%3COFd",
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
  "Phone": {
   "id": "Ne%7DI",
   "type": "phone_number",
   "phone_number": "88005553535"
  },
  "CreationDate": {
   "id": "P%3Doo",
   "type": "date",
   "date": {
    "start": "2024-10-09T12:14:00+03:00",
    "end": null,
    "time_zone": null
   }
  },
  "Active": {
   "id": "Ub%7C%5D",
   "type": "checkbox",
   "checkbox": true
  },
  "Number": {
   "id": "%5Dotl",
   "type": "number",
   "number": 1
  },
  "Email": {
   "id": "%60%7DN%3F",
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
   "id": "bAZ%7D",
   "type": "select",
   "select": {
    "id": "0e626378-0386-4985-88de-b747968504e7",
    "name": "New",
    "color": "green"
   }
  },
  "User": {
   "id": "%7B%3Bsu",
   "type": "people",
   "people": []
  },
  "Image": {
   "id": "%7B%3F%5B%3F",
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
 "url": "https://www.notion.so/LLC-Vector-11a82aa7fc4e819695c5d8db91cb3fb1",
 "public_url": null,
 "request_id": "32934a59-8bbd-495e-b65a-559df6d5762f"
}
```
