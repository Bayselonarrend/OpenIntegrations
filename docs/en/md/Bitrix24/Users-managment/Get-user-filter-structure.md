---
sidebar_position: 8
---

# Get user filter structure
 Returns the field structure for filtering users in the FindUsers method



`Function GetUserFilterStructure(Val Clear = False) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

 
 Returns: Structure of KeyAndValue - Fields structure

<br/>




	


```sh title="CLI command example"
 
 oint bitrix24 GetUserFilterStructure --empty %empty%

```


