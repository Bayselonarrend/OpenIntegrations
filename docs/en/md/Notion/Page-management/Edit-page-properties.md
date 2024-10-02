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
    Icon    = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";
    Cover   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg";
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

```
