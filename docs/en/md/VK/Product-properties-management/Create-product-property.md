﻿---
sidebar_position: 2
---

# Create product property
 Creates a new property for use in products



`Function CreateProductProperty(Val Name, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Property name |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 
 Name = "Color";
 
 Result = OPI_VK.CreateProductProperty(Name, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk CreateProductProperty --title %title% --auth %auth%

```

```json title="Result"
{
 "response": {
 "property_id": 260
 }
 }
```
