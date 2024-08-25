---
sidebar_position: 7
---

# Get deals filter structure
 Returns the field structure for filtering deals in the GetDealsList method



`Function GetDealsFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetDealsFilterStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetDealsFilterStructure --empty %empty%

```

```json title="Result"

```
