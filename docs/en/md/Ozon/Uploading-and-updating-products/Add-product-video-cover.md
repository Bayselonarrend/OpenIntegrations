---
sidebar_position: 24
---

# Add product video cover
 Adds a video cover to the product attributes



`Function AddProductVideoCover(ItemStructure, Val URL) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ItemStructure | --item | Structure Of String | The basic structure of the product fields. See GetProductStructure |
  | URL | --url | String | URL of the video cover |

  
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

    // Videocover

    OPI_Ozon.AddProductVideoCover(ItemStructure, Video);
```



```sh title="CLI command example"
    
  oint ozon AddProductVideoCover --item %item% --url %url%

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
     "id": 21845,
     "complex_id": 100002,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/"
      }
     ]
    }
   ]
  }
 ]
}
```
