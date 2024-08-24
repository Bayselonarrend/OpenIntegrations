---
sidebar_position: 2
---

# Create products by Ozon ID
 Creates a product by specified Ozon ID



`Function CreateProductByOzonID(Val ClientID, Val APIKey, Val ProductsArray) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | ProductsArray | --items | Array Of String | Array or one simplified structure of product fields |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can get an empty structure using the GetSimplifiedProductStructure method()

 It is not possible to update a product fields by Ozon ID

 Method at API documentation: [post /v1/product/import-by-sku](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsBySKU)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    ItemStructure = New Structure;
    ItemStructure.Insert("name"         , "New imported product");
    ItemStructure.Insert("sku"          , 298789742);
    ItemStructure.Insert("offer_id"     , "91132");
    ItemStructure.Insert("price"        , "1100");
    ItemStructure.Insert("old_price"    , "1100");
    ItemStructure.Insert("vat"          , "0.1");
    ItemStructure.Insert("currency_code", "RUB");

    Result = OPI_Ozon.CreateProductByOzonID(ClientID, APIKey, ItemStructure);
```



```sh title="CLI command example"
    
oint ozon CreateProductByOzonID --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --items %items%

```

```json title="Result"

```
