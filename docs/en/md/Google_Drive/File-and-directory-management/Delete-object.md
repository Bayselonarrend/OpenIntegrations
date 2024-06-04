---
sidebar_position: 9
---

# Delete object
 Deletes file or directory by ID


*Function DeleteObject(Val Token, Val Identifier) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Identifier | --object | String | Identifier of the object to delete |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Identifier = "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa";
 
 Response = OPI_GoogleDrive.DeleteObject(Token, Identifier); //Map
 

	
```

```sh title="CLI command example"
 
 oint gdrive DeleteObject --token %token% --object "1dg_MwwwPSPYT0p3y-8dvGWoapbwaaaaa"

```


```json title="Result"

''

```
