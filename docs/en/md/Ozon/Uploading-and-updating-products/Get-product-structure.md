---
sidebar_position: 16
---

# Get product structure
 Gets the structure of product standard fields



`Function GetProductStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Product fields structure

<br/>

:::tip
This structure should be supplemented with fields that depend on the product category from GetCategoryAttributes()

 The first image in the image array (images field) will be the main image
:::
<br/>


```bsl title="Code example"
    Result = OPI_Ozon.GetProductStructure();
```



```sh title="CLI command example"
    
  oint ozon GetProductStructure --empty %empty%

```

```json title="Result"
{
 "description_category_id": "<ID category product>",
 "name": "<name product>",
 "offer_id": "<offer>",
 "barcode": "<barcode>",
 "price": "<price>",
 "old_price": "<old price>",
 "vat": "<VAT rate, e.g. 0.2>",
 "height": "<height>",
 "width": "<width>",
 "depth": "<depth>",
 "dimension_unit": "<unit of measure for sizes, e.g. mm>",
 "weight": "<weight>",
 "weight_unit": "<unit of measurement for weight, e.g. g>",
 "images": "<array of product images URLs>",
 "images360": "<array of 360 images URLs>",
 "color_image": "<marketing color for pictures>"
}
```
