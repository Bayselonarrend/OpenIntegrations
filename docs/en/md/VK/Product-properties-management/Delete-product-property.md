---
sidebar_position: 4
---

# Delete product property
 Deletes the existing product property



`Function DeleteProductProperty(Val Property, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Property | --prop | String, Number | Property ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 
 Property = "607";
 
 Result = OPI_VK.DeleteProductProperty(Property, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk DeleteProductProperty --prop %prop% --auth %auth%

```

```json title="Result"
{
 "response": 1
 }
```
