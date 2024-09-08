﻿---
sidebar_position: 2
---

# Get products attributes data
 Retrieves product attributes descriptions with or without filtering



`Function GetProductsAttributesData(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | Filter | --filter | Structure of KeyAndValue | Product selection filter. See GetProductsFilterStructure |
  | LastID | --last | String, Number | ID of the last value (last_id) from the previous response |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
Method at API documentation: [post /v3/products/info/attributes](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductAttributesV3)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Result = OPI_Ozon.GetProductsAttributesData(ClientID, APIKey, Filter);
```



```sh title="CLI command example"
    
  oint ozon GetProductsAttributesData --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --filter %filter% --last %last%

```

```json title="Result"
{
 "result": [
  {
   "id": 1168052279,
   "barcode": "",
   "category_id": 0,
   "name": "Protective film set for X3 NFC. Dark cotton",
   "offer_id": "143210608",
   "height": 250,
   "depth": 10,
   "width": 150,
   "dimension_unit": "mm",
   "weight": 100,
   "weight_unit": "g",
   "images": [
    {
     "file_name": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
     "default": false,
     "index": 1
    },
    {
     "file_name": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
     "default": false,
     "index": 2
    }
   ],
   "image_group_id": "",
   "images360": [],
   "pdf_list": [],
   "attributes": [
    {
     "attribute_id": 85,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 5060050,
       "value": "Samsung"
      }
     ]
    },
    {
     "attribute_id": 10096,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 61576,
       "value": "red"
      }
     ]
    },
    {
     "attribute_id": 8229,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 95911,
       "value": "Protective film set for X3 NFC. Dark cotton"
      }
     ]
    },
    {
     "attribute_id": 9048,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "Protective film set for X3 NFC. Dark cotton"
      }
     ]
    },
    {
     "attribute_id": 4180,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "Protective film set for X3 NFC. Dark cotton"
      }
     ]
    },
    {
     "attribute_id": 9024,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "143210608"
      }
     ]
    },
    {
     "attribute_id": 20900,
     "complex_id": 0,
     "values": [
      {
       "dictionary_value_id": 0,
       "value": "true"
      }
     ]
    }
   ],
   "complex_attributes": [
    {
     "attributes": [
      {
       "attribute_id": 21837,
       "complex_id": 100001,
       "values": [
        {
         "dictionary_value_id": 0,
         "value": "viedo1"
        }
       ]
      },
      {
       "attribute_id": 21841,
       "complex_id": 100001,
       "values": [
        {
         "dictionary_value_id": 0,
         "value": "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/"
        }
       ]
      }
     ]
    }
   ],
   "color_image": "",
   "last_id": "",
   "description_category_id": 17028922
  }
 ],
 "total": 1,
 "last_id": ""
}
```