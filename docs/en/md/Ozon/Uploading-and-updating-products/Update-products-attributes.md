---
sidebar_position: 3
---

# Update products attributes
 Updates the attributes of the selected items



`Function UpdateProductsAttributes(Val ClientID, Val APIKey, Val AttributesArray) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ClientID | --clientid | String | Client identifier |
  | APIKey | --apikey | String | API key |
  | AttributesArray | --items | Array Of String | Array or one structure of product attribute fields |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Ozon Seller API

<br/>

:::tip
You can get an empty structure using the GetAttributesUpdateStructure method()

 Method at API documentation: [post /v1/product/attributes/update](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateAttributes)
:::
<br/>


```bsl title="Code example"
    ClientID = "2128753";
    APIKey   = "7cc90d26-33e4-499b...";

    AttributesStructure = New Structure("offer_id", "143210608");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050 , "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576 , "red");

    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 10096, 0, CategoryAttribute3);

    Result = OPI_Ozon.UpdateProductsAttributes(ClientID, APIKey, AttributesStructure);
```



```sh title="CLI command example"
    
oint ozon UpdateProductsAttributes --clientid "2128753" --apikey "7cc90d26-33e4-499b..." --items %items%

```

```json title="Result"

```
