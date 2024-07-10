---
sidebar_position: 5
---

# Add product property variant
 Adds a variant for an existing property


<br/>


`Function AddProductPropertyVariant(Val Value, Val Property, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Value | --value | String | Property value |
 | Property | --prop | String, Number | Property ID where the variant is added |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

<br/>




```bsl title="Code example"
Response = OPI_VK.AddProductPropertyVariant("Red", 260, Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk AddProductPropertyVariant --value %value% --prop %prop% --auth %auth%

```

```json title="Result"
{
 "response": {
 "variant_id": 980
 }
 }
```
