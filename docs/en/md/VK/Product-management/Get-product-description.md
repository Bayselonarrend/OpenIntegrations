---
sidebar_position: 8
---

# Get description product. 



*Function GetProductDescription() Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|

 
 Returns: Key-Value Pair - Empty product description:


```bsl title="Code example"
	

	
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
