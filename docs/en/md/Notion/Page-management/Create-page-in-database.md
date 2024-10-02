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
    Image_ = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"; // URL, Binary Data or Path to file

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

```
