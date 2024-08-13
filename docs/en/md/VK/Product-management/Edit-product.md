---
sidebar_position: 5
---

# Edit product
 Edits a previously created product



`Function EditProduct(Val Product, Val ProductDescription, Val Selection = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Product | --item | Number, String | Identifier of the product being edited |
  | ProductDescription | --product | Map Of KeyAndValue | JSON description of the product or path |
  | Selection | --sel | String | Identifier of the new selection, if needed |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters = GetVKParameters();
  
  Product = FunctionParameters["VK_MarketItemID"];
  
  ProductDescription = New Map;
  ProductDescription.Insert("Name", "EditedTestProduct");
  
  Result = OPI_VK.EditProduct(Product, ProductDescription, , Parameters);
```



```sh title="CLI command example"
    
  oint vk EditProduct --item "9372711" --product %product% --sel %sel% --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": 1
  }
```
