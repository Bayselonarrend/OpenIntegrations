---
sidebar_position: 8
---

# Get product price structure
 Gets the product price structure for the UpdateProductsPrices function



`Function GetProductPriceStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Filter fields structure

<br/>

:::tip
The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v1/product/import/prices](https://docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsPrices)
:::
<br/>


```bsl title="Code example"
    Result = OPI_Ozon.GetProductPriceStructure();
```
 



```json title="Result"
{
 "auto_action_enabled": "<Enable auto application of shares: ENABLED or DISABLED>",
 "currency_code": "<currency>",
 "min_price": "<minimum price of product after promotions have been applied>",
 "offer_id": "<product identifier in the sellers system>",
 "old_price": "<price before discounts; specify 0 if no discounts are available>",
 "price": "<product price with discounts>",
 "price_strategy_enabled": "<auto application of price strategies: ENABLED or DISABLED>",
 "product_id": "<Product ID>"
}
```
