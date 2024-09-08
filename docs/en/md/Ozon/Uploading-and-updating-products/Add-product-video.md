---
sidebar_position: 24
---

# Add product video
 Adds video to product attributes



`Function AddProductVideo(ItemStructure, Val URL, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ItemStructure | --item | Structure Of String | The basic structure of the product fields. See GetProductStructure |
  | URL | --url | String | URL of the video |
  | Name | --title | String | Technical name of the video |

  
  Returns:  Structure of KeyAndValue - Structure of product fields with added video

<br/>

:::tip
In 1C the method can be used as a procedure, without getting a return value. Return value is required for CLI version
:::
<br/>


```bsl title="Code example"
    Video = "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/";

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210608");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1000");
    ItemStructure.Insert("old_price"              , "1100");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");

    // Video

    OPI_Ozon.AddProductVideo(ItemStructure, Video, "viedo1");
```



```sh title="CLI command example"
    
  oint ozon AddProductVideo --item %item% --url %url% --title %title%

```

```json title="Result"
{
 "description_category_id": 17028922,
 "name": "Protective film set for X3 NFC. Dark cotton",
 "offer_id": "143210608",
 "barcode": "112772873170",
 "price": "1000",
 "old_price": "1100",
 "vat": "0.1",
 "height": 250,
 "width": 150,
 "depth": 10,
 "dimension_unit": "mm",
 "weight": 100,
 "weight_unit": "g",
 "complex_attributes": [
  {
   "attributes": [
    {
     "id": 21841,
     "complex_id": 100001,
     "values": [
      {
       "value": "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/"
      }
     ]
    },
    {
     "id": 21837,
     "complex_id": 100001,
     "values": [
      {
       "value": "viedo1"
      }
     ]
    }
   ]
  }
 ]
}
```
