---
sidebar_position: 6
---

# Edit product property variant
 Edits the value of an existing product property variant



`Function EditProductPropertyVariant(Val Value, Val Property, Val Option, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Value | --value | String | New property value |
 | Property | --prop | String, Number | Property ID |
 | Option | --option | String, Number | Variant ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

<br/>




```bsl title="Code example"
 
 Response = OPI_VK.EditProductPropertyVariant("Yellow", 260, 980 Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk EditProductPropertyVariant --value %value% --prop %prop% --option %option% --auth %auth%

```

```json title="Result"
{
 "response": 1
 }
```
