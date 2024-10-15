---
sidebar_position: 6
---

# Delete product
 Deletes a previously created product



`Function DeleteProduct(Val Product, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Product | --item | String, Number | Product ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Product = "9756133";

    Result = OPI_VK.DeleteProduct(Product, Parameters);
```
 



```json title="Result"
{
 "response": 1
}
```
