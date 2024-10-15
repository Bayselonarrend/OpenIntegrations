---
sidebar_position: 6
---

# Remove product from selection
 Removes a previously added product from the selection



`Function RemoveProductFromSelection(Val Product, Val Selection, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Product | --item | String | Product ID |
  | Selection | --sel | String | Selection ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters = GetVKParameters();
  
  Product = "9372711";
  Selection = "125";
  
  Result = OPI_VK.RemoveProductFromSelection(Product, Selection, Parameters);
```
 



```json title="Result"
{
 "response": 1
}
```
