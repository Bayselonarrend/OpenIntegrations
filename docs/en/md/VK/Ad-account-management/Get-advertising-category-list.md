---
sidebar_position: 4
---

# Get a list of advertising categories
 Gets a list of advertising category IDs for creating an advertising post


<br/>


`Function GetAdvertisingCategoryList(Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
Response = OPI_VK.GetAdvertisingCategoryList(Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk GetAdvertisingCategoryList --auth %auth%

```

```json title="Result"
{
 "response": {
 "v2": [
 {
 "subcategories": [
 {
 "subcategories": [
 {
 "name": "Mobile phones and tablets",
 "id": 202
 },
 {
 "name": "Audio and video",
 "id": 203
 },
 {
 "name": "Portable gadgets",
 "id": 204
 },
 {
 "name": "Consoles",
 "id": 205
 },
 ...
 ]
 }
 ]
 }
 ]
 }
 }
```
