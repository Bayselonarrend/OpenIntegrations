﻿---
sidebar_position: 23
---

# Get products filter structure
 Gets the structure for selecting the list of products



`Function GetProductsFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Filter fields structure

<br/>

:::tip
Related functions: GetProductList, GetProductsStocks, GetProductsPrices

 The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v2/product/list](https://docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
:::
<br/>


```bsl title="Code example"
    Result = OPI_Ozon.GetProductsFilterStructure();
```



```sh title="CLI command example"
    
  oint ozon GetProductsFilterStructure --empty %empty%

```

```json title="Result"
{
 "offer_id": "<articles array>",
 "product_id": "<Products IDs array>",
 "visibility": "<visibility>"
}
```
