﻿---
sidebar_position: 3
---

# Get attribute values
 Gets the list of available values of the attribute



`Function GetAttributeValues(Val ClientID, Val APIKey, Val CategoryID, Val TypeID, Val AttributeID, Val CatalogID = 1, Val Lang = "DEFAULT") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | CategoryID | --categoryid | String, Number | Category identifier |
  | TypeID | --typeid | String, Number | Item type identifier |
  | AttributeID | --attributeid | String, Number | Attribute IDs for obtaining values |
  | CatalogID | --start | String, Number | ID of the first catalog in the response |
  | Lang | --lang | String | Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
You can find out if there is a nested catalog by the GetCharacteristicsCategories method()

 Method at API documentation: [post /v1/description-category/attribute/values](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributeValues)
:::
<br/>


```bsl title="Code example"
    ClientID    = "2128753";
    APIKey      = "7cc90d26-33e4-499b...";
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;

    Result = OPI_Ozon.GetAttributeValues(ClientID, APIKey, CategoryID, TypeID, AttributeID);
```



```sh title="CLI command example"
    
  oint ozon GetAttributeValues --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --categoryid %categoryid% --typeid %typeid% --attributeid %attributeid% --start %start% --lang %lang%

```

```json title="Result"
{
 "result": [
  {
   "id": 5056737,
   "value": "Essence",
   "info": "Красота и здоровье",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-v/6088253599.jpg"
  },
  {
   "id": 5057962,
   "value": "Hot",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1/6011312389.jpg"
  },
  {
   "id": 5058518,
   "value": "CS",
   "info": "",
   "picture": ""
  },
  {
   "id": 5059837,
   "value": "Каскад",
   "info": "Зоотовары",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6027361156.jpg"
  },
  {
   "id": 5062537,
   "value": "Enigma",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-5/6427347617.jpg"
  },
  {
   "id": 5062790,
   "value": "Kitfort",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-6/6737348550.jpg"
  },
  {
   "id": 5064843,
   "value": "Parlux",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-w/6011101280.jpg"
  },
  {
   "id": 5065236,
   "value": "Сателлит",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6010470136.jpg"
  },
  {
   "id": 5066816,
   "value": "Carioca",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-8/6063013796.jpg"
  },
  {
   "id": 5068632,
   "value": "Bawi",
   "info": "",
   "picture": ""
  },
  {
   "id": 5069237,
   "value": "Kodak",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-m/6011062066.jpg"
  },
  {
   "id": 5069442,
   "value": "Mattel",
   "info": "Детские игрушки",
   "picture": "https://cdn1.ozone.ru/multimedia/1013076413.jpg"
  },
  {
   "id": 5071003,
   "value": "Ivo",
   "info": "",
   "picture": ""
  },
  {
   "id": 5071289,
   "value": "HTC",
   "info": "",
   "picture": "https://cdn1.ozone.ru/multimedia/1011058578.jpg"
  },
  {
   "id": 5073069,
   "value": "Ghost",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073089,
   "value": "Oleg Cassini",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073356,
   "value": "Ritzenhoff & Breker",
   "info": "",
   "picture": ""
  },
  {
   "id": 5073389,
   "value": "William Levene",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074417,
   "value": "KEF",
   "info": "",
   "picture": ""
  },
  {
   "id": 5074684,
   "value": "Cutipol",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-o/6011755428.jpg"
  },
  {
   "id": 5075889,
   "value": "Jacob Zeidler & Co",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076255,
   "value": "The Original Book Works Limited",
   "info": "",
   "picture": ""
  },
  {
   "id": 5076787,
   "value": "Ocean Extreme",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077287,
   "value": "Народное искусство",
   "info": "",
   "picture": ""
  },
  {
   "id": 5077379,
   "value": "Zyliss",
   "info": "",
...
```
