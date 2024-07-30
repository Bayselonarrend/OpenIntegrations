---
sidebar_position: 1
---

# Get property list
 Gets the list of properties of group products



`Function GetPropertyList(Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 
 Response = OPI_VK.GetPropertyList(Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk GetPropertyList --auth %auth%

```

```json title="Result"
[
 {
 "variants": [
 {
 "title": "Yellow",
 "id": 962
 },
 {
 "title": "Blue",
 "id": 963
 },
 {
 "title": "Red",
 "id": 964
 }
 ],
 "type": "text",
 "title": "Color",
 "id": 255
 }
 ]
```
