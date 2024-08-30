---
sidebar_position: 14
---

# Get attributes update structure
 Gets the structure for updating product characteristics in the UpdateProductsAttributes function()



`Function GetAttributesUpdateStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Product fields structure

<br/>

:::tip
<Attributes> are structures with complex_id, id and values fields. For their quick creation there is the CompleteComplexAttribute method()
:::
<br/>


```bsl title="Code example"
    Result = OPI_Ozon.GetAttributesUpdateStructure();
```



```sh title="CLI command example"
    
  oint ozon GetAttributesUpdateStructure --empty %empty%

```

```json title="Result"
{
 "offer_id": "<article>",
 "attributes": "<array of updatable attributes>"
}
```
