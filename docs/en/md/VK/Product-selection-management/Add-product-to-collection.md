---
sidebar_position: 5
---

# Add product to selection
 Adds a product to the selection



`Function AddProductToCollection(Val ProductsArray, Val Selection, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ProductsArray | --items | Array of string, number | Array of products or product |
 | Selection | --sel | String | Selection ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 
 Product = "9372711";
 Selection = "125";
 
 Result = OPI_VK.AddProductToCollection(Product, Selection, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk AddProductToCollection --items %items% --sel %sel% --auth %auth%

```

```json title="Result"
{
 "response": 1
 }
```
