---
sidebar_position: 7
---

# Get lead filter structure
 Returns the field structure for filtering leads in the GetLeadsList method



`Function GetLeadFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetLeadFilterStructure();
```



```sh title="CLI command example"
    
oint bitrix24 GetLeadFilterStructure --empty %empty%

```

```json title="Result"

```
