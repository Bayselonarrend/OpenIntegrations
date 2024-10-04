---
sidebar_position: 4
---

# Edit page properties
 Changes the properties of an existing page



`Function EditPageProperties(Val Token, Val Page, Val Data = "", Val Icon = "", Val Cover = "", Val Archived = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Page | --page | String | ID of the page being modified |
  | Data | --data | Map Of KeyAndValue | Map of editable parameters |
  | Icon | --icon | String | URL of the page icon image |
  | Cover | --cover | String | URL of the page cover image |
  | Archived | --archive | Boolean | Archive page or not (boolean) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Notion

<br/>




```bsl title="Code example"
    Token   = "secret_9RsfMrRMqZwqp0Zl0B...";
    Page    = "11282aa7-fc4e-814c-990c-dd3c9c3c2c22";
    Icon    = "https://openyellow.neocities.org/test_data/picture.jpg";
    Cover   = "https://openyellow.neocities.org/test_data/picture2.jpg";
    Archive = False;

    Properties = New Map;
    Properties.Insert("Active" , False);
    Properties.Insert("Email"  , "vector@mail.ru");

    Result = OPI_Notion.EditPageProperties(Token
        , Page
        , Properties
        , Icon
        , Cover
        , Archive);
```



```sh title="CLI command example"
    
  oint notion EditPageProperties --token "secret_9RsfMrRMqZwqp0Zl0B..." --page "5dd94c34fab04bff9..." --data %data% --icon "https://opi.neocities.org/img/logo.png" --cover "https://opi.neocities.org/assets/images/logo_long-e69f28017feff1759ffcfe3f4e7bbf2a.png" --archive %archive%

```

```json title="Result"
{
 "object": "page",
 "id": "11382aa7-fc4e-819a-80d4-feb525be9b58",
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
 "cover": {
  "type": "external",
  "external": {
   "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"
  }
 },
 "icon": {
  "type": "external",
  "external": {
   "url": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"
  }
 },
 "parent": {
  "type": "page_id",
  "page_id": "5dd94c34-fab0-4bff-986b-7511c0779f77"
 },
 "archived": false,
 "in_trash": false,
 "properties": {
  "title": {
   "id": "title",
   "type": "title",
   "title": [
    {
     "type": "text",
     "text": {
      "content": "title",
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
     "plain_text": "title",
     "href": null
    }
   ]
  }
 },
 "url": "https://www.notion.so/title-11382aa7fc4e819a80d4feb525be9b58",
 "public_url": null,
 "request_id": "b7e4d6cc-7466-422e-a5ff-2c3ceb69b8db"
}
```
