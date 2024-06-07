---
sidebar_position: 4
---

# Add product
 Adds a new product to the community's catalog


*Function AddProduct(Val ProductDescription, Val Selection = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ProductDescription | --product | Map Of KeyAndValue | JSON description of the product or path |
 | Selection | --sel | String | Selection ID for placing the product, if needed |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 
 ImageArray = New Array;
 ImageArray.Add(Image);
 ImageArray.Add(Image);
 
 Product = New Map();
 Product.Insert("Name", "TestProduct");
 Product.Insert("Description", "Product description");
 Product.Insert("Category", "20173");
 Product.Insert("Price", 1);
 Product.Insert("OldPrice", 15);
 Product.Insert("MainPhoto", Image);
 Product.Insert("URL", "https://github.com/Bayselonarrend/OpenIntegrations");
 Product.Insert("AdditionalPhotos", ImageArray);
 Product.Insert("MainInGroup", True);
 Product.Insert("Width", 20);
 Product.Insert("Height", 30);
 Product.Insert("Depth", 40);
 Product.Insert("Weight", 100);
 Product.Insert("SKU", "12345");
 Product.Insert("AvailableBalance", "10");
 
 Response = OPI_VK.AddProduct(Product, SelectionID, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint vk AddProduct --product %product% --sel %sel% --auth %auth%


```


```json title="Result"

{
 "response": {
 "market_item_id": 8656047
 }
 }

```
