---
sidebar_position: 1
---

# Get a list of product categories
 Gets a list of product category IDs to specify when creating a product


*Function GetProductCategoryList(Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of String - Key - ID, Value - Name

```bsl title="Code example"
	
 
 Response = OPI_VK.GetProductCategoryList(Parameters); //Map
 
	
```

```sh title="CLI command example"
 
 oint vk GetProductCategoryList --auth %auth%


```


```json title="Result"

Key Value
 1210	"Business"
 1200	"Photo and video service"
 2162	"Repair and building"
 ...

```
