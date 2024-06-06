---
sidebar_position: 5
---

# Edit product
 Edits a previously created product


*Function EditProduct(Val Product, Val ProductDescription, Val Selection = "", Val Parameters = "") ExportReturn ProductManagement(ProductDescription, Product, Selection, Parameters);EndFunction*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Product | --item | Number, String | Identifier of the product being edited |
 | ProductDescription | --product | Map Of KeyAndValue | JSON description of the product or path |
 | Selection | --sel | String | Identifier of the new selection, if needed |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Product = New Map;
 Product.Insert("Name", "EditedTestProduct");
 
 Response = OPI_VK.EditProduct(ProductID, Product,, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
 
	
```

```sh title="CLI command example"
 
 oint vk EditProduct --item %item% --product %product% --sel %sel% --auth %auth%


```


```json title="Result"

{
 "response": 1
 }

```
