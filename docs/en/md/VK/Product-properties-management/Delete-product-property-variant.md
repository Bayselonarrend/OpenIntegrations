---
sidebar_position: 7
---

# Delete product property variant
 Deletes the previously created product property variant


*Function DeleteProductPropertyVariant(Val Option, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Option | --option | String, Number | Variant ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK 

```bsl title="Code example"
	
 
 Response = OPI_VK.DeleteProductPropertyVariant(980 Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint vk DeleteProductPropertyVariant --option %option% --auth %auth%


```


```json title="Result"

{
 "response": 1
 }

```
