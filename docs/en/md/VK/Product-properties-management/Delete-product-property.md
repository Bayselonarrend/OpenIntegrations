---
sidebar_position: 4
---

# Delete product property
 Deletes the existing product property


<br/>


`Function DeleteProductProperty(Val Property, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Property | --prop | String, Number | Property ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

<br/>




```bsl title="Code example"
 
 Response = OPI_VK.DeleteProductProperty(260, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk DeleteProductProperty --prop %prop% --auth %auth%

```

```json title="Result"
 {
 "response": 1
 }
```
