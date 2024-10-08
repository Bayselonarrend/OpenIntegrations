﻿---
sidebar_position: 8
---

# Get user filter structure
 Returns the field structure for filtering users in the FindUsers method



`Function GetUserFilterStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetUserFilterStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetUserFilterStructure --empty %empty%

```

```json title="Result"
{
 "NAME": "<name>",
 "LAST_NAME": "<surname>",
 "WORK_POSITION": "<position>",
 "UF_DEPARTMENT_NAME": "<department name>",
 "USER_TYPE": "<type: employee, extranet, email>"
}
```
