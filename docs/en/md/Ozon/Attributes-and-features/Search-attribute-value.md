---
sidebar_position: 4
---

# Search attribute value
 Gets the reference values of the attribute by the specified value



`Function SearchAttributeValue(Val ClientID, Val APIKey, Val CategoryID, Val TypeID, Val AttributeID, Val Value) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | CategoryID | --categoryid | String, Number | Category identifier |
  | TypeID | --typeid | String, Number | Item type identifier |
  | AttributeID | --attributeid | String, Number | Attribute IDs for obtaining values |
  | Value | --value | String | Search value |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Ozon Seller API

<br/>

:::tip
You can find out if there is a nested catalog by the GetCharacteristicsCategories method()

 Method at API documentation: [post /v1/description-category/attribute/values/search](https://docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_SearchAttributeValues)
:::
<br/>


```bsl title="Code example"
    ClientID    = "2128753";
    APIKey      = "7cc90d26-33e4-499b...";
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;
    Value       = "Sunshine";

    Result = OPI_Ozon.SearchAttributeValue(ClientID
        , APIKey
        , CategoryID
        , TypeID
        , AttributeID
        , Value);
```
 



```json title="Result"
{
 "result": [
  {
   "id": 5055881,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-i/6010930878.jpg"
  },
  {
   "id": 971026862,
   "value": "SUNSHINE",
   "info": "Спорт и отдых",
   "picture": ""
  },
  {
   "id": 971719299,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-v/6601244203.jpg"
  },
  {
   "id": 971818888,
   "value": "Sunshine",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-p/6644299477.jpg"
  },
  {
   "id": 972176200,
   "value": "sunshine",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/e6dcf5aa-eb30-442d-afa0-5812652d2816.png"
  },
  {
   "id": 972202223,
   "value": "SUNSHINE",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/68384d8e-4b49-4f99-a045-3403c1f10f0f.jpg"
  },
  {
   "id": 971227292,
   "value": "Sunshine Baby",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-r/6299308959.jpg"
  },
  {
   "id": 972029069,
   "value": "Sunshine Beams",
   "info": "",
   "picture": ""
  },
  {
   "id": 971168926,
   "value": "Sunshine-Craft",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-u/6267516354.jpg"
  },
  {
   "id": 972173064,
   "value": "Sunshine Day",
   "info": "",
   "picture": ""
  },
  {
   "id": 970974258,
   "value": "sunshinefilm",
   "info": "Защитная пленка на экран смартфона, гидрогелевая",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-w/6048813188.jpg"
  },
  {
   "id": 972066951,
   "value": "SunShineFox",
   "info": "",
   "picture": ""
  },
  {
   "id": 972172514,
   "value": "SUNSHINEFXY",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/d48c1614-b9c4-4785-b9ef-3142f5cfb12c.png"
  },
  {
   "id": 971110891,
   "value": "Sunshine Habibi",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-4/6158730376.jpg"
  },
  {
   "id": 971896068,
   "value": "Sunshine House",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-b/6704404415.jpg"
  },
  {
   "id": 971967921,
   "value": "SunShine in me",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-1/6775950013.jpg"
  },
  {
   "id": 970712762,
   "value": "Sunshine Innovations",
   "info": "",
   "picture": ""
  },
  {
   "id": 5115939,
   "value": "Sunshine Kids",
   "info": "",
   "picture": ""
  },
  {
   "id": 971303326,
   "value": "Sunshine Lady",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-p/6371652253.jpg"
  },
  {
   "id": 972131760,
   "value": "Sunshineland",
   "info": "",
   "picture": "https://cdn1.ozonusercontent.com/s3/product-service-meta-media/63bfd44b-6338-4fa6-8843-39b1c7827099.jpg"
  },
  {
   "id": 5142226,
   "value": "Sunshine Optics",
   "info": "",
   "picture": ""
  },
  {
   "id": 972026686,
   "value": "SUNSHINE PANDI",
   "info": "",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-3/6842409075.jpg"
  },
  {
   "id": 970954160,
   "value": "SUNSHINE PEARL",
   "info": "Соль для ванны",
   "picture": "https://cdn1.ozone.ru/s3/multimedia-j/6041114827.jpg"
  },
  {
   "id": 970697481,
   "value": "SunShines",
   "info": "",
   "picture": ""
  },
  {
   "id": 972077059,
   "value": "Sunshine shop",
   "info": "",
...
```
