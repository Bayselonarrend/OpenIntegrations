﻿---
sidebar_position: 8
---

# Get product description
 Gets the description template for creating a product



`Function GetProductDescription(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Map Of KeyAndValue - Fields map

<br/>




```bsl title="Code example"
    Result = OPI_VK.GetProductDescription();
```



```sh title="CLI command example"
    
  oint vk GetProductDescription

```

```json title="Result"
{
 "Name": "New product",
 "Description": "Product description",
 "Category": "20173",
 "Price": 1,
 "OldPrice": null,
 "MainPhoto": null,
 "URL": null,
 "AdditionalPhotos": [],
 "PropertyValues": [],
 "MainInGroup": false,
 "Width": null,
 "Height": null,
 "Depth": null,
 "Weight": null,
 "SKU": null,
 "AvailableBalance": 1
}
```
