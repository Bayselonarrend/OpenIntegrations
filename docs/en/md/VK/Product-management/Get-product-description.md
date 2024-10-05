---
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
    Parameters = GetVKParameters();

    Result = OPI_VK.GetProductDescription();
```



```sh title="CLI command example"
    
  oint vk GetProductDescription

```

```json title="Result"
Product = New Map();
  Product.Insert("Name", "New product"); // Product name
  Product.Insert("Description", "Product description"); // Product description
  Product.Insert("Category", "20173"); // See GetProductCategoryList()
  Product.Insert("Price", 1); // Price.
  Product.Insert("OldPrice", Undefined); // For reflection change price
  Product.Insert("MainPhoto", Undefined); // BD or path to main. photo
  Product.Insert("URL", Undefined); // Link to page store
  Product.Insert("AdditionalPhotos", New Array); // Array paths or BD for add. photo
  Product.Insert("PropertyValues", New Array); // Values properties (variants). Maximum 2
  Product.Insert("MainInGroup", False); // Make main in of its group
  Product.Insert("Width", Undefined); // In millimeters
  Product.Insert("Height", Undefined); // In millimeters
  Product.Insert("Depth", Undefined); // In millimeters
  Product.Insert("Weight", Undefined); // In grams
  Product.Insert("SKU", Undefined); // SKU
  Product.Insert("AvailableBalance", 1);
```
