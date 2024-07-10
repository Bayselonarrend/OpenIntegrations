---
sidebar_position: 26
---

# Get structure of tasks filter
 Return filter structure for GetTasksList


<br/>


`Function GetTasksFilterStructure(Val Clear = False) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

 
 Returns: Structure of Key-Value - Fields structure 





	


```sh title="CLI command example"
 
 oint bitrix24 GetTasksFilterStructure --empty %empty%

```


