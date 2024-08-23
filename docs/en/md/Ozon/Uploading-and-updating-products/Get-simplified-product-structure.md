---
sidebar_position: 6
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

```
