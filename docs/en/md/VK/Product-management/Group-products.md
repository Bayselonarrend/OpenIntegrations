---
sidebar_position: 7
---

# Group products
 Groups products based on similar sets of properties


<br/>


`Function GroupProducts(Val ProductsArray, Val ExistingGroup = "", Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ProductsArray | --items | Array Of String | Array of product IDs |
 | ExistingGroup | --sellgroup | String | ID of the existing group, if needed |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 
 ProductsArray = New Array;
 ProductsArray.Add(YellowItemID);
 ProductsArray.Add(RedItemID);
 
 Response = OPI_VK.GroupProducts(ProductsArray,, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk GroupProducts --items %items% --sellgroup %sellgroup% --auth %auth%

```

```json title="Result"
 {
 "response": {
 "item_group_id": 5957
 }
 }
```
