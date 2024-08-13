---
sidebar_position: 1
---

# Get a list of product categories
 Gets a list of product category IDs to specify when creating a product



`Function GetProductCategoryList(Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of String - Key - ID, Value - Name

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Result = OPI_VK.GetProductCategoryList(Parameters);
```



```sh title="CLI command example"
    
  oint vk GetProductCategoryList --auth "GetVKParameters()"

```

```json title="Result"
  Key Value
  1210	"Business"
  1200	"Photo and video service"
  2162	"Repair and building"
  ...

```
