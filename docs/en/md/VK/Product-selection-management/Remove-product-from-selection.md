---
sidebar_position: 6
---

# Remove product from selection
 Removes a previously added product from the selection


<br/>


`Function RemoveProductFromSelection(Val Product, Val Selection, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Product | --item | String | Product ID |
 | Selection | --sel | String | Selection ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
Response = OPI_VK.RemoveProductFromSelection(8656559, 40, Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk RemoveProductFromSelection --item %item% --sel %sel% --auth %auth%

```

```json title="Result"
{
 "response": 1
 }
```
