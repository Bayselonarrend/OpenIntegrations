---
sidebar_position: 17
---

# Get simplified product structure
 Gets the structure for creating a product based on Ozon ID in the CreateProductByOzonID function()



`Function GetSimplifiedProductStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Product fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Ozon.GetSimplifiedProductStructure();
```



```sh title="CLI command example"
    
  oint ozon GetSimplifiedProductStructure --empty %empty%

```

```json title="Result"
{
 "name": "<name>",
 "sku": "<product identifier in the Ozon system>",
 "offer_id": "<article>",
 "price": "<price>",
 "old_price": "<old price>",
 "vat": "<VAT rate, e.g. 0.2>",
 "currency_code": "<currency>"
}
```
