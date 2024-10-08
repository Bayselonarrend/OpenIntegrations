﻿---
sidebar_position: 7
---

# Get product stocks structure
 Gets the data structure for udpating product stocks in the UpdateProductsStocks function



`Function GetProductStocksStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Filter fields structure

<br/>

:::tip
The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v2/products/stocks](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ProductsStocksV2)
:::
<br/>


```bsl title="Code example"
    Result = OPI_Ozon.GetProductStocksStructure();
```



```sh title="CLI command example"
    
  oint ozon GetProductStocksStructure --empty %empty%

```

```json title="Result"
{
 "offer_id": "<article>",
 "product_id": "<Product ID>",
 "stock": "<amount>",
 "warehouse_id": "<Warehouse ID>"
}
```
