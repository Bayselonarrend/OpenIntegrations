---
sidebar_position: 1
---

# Get list of bases
 Gets the list of available bases


<br/>


`Function GetListOfBases(Val Token, Val Indent = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Indent | --offset | String | Next page identifier of the base list from the previous request |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Airtable 

<br/>




```bsl title="Code example"
 
 
 Response = OPI_Airtable.GetListOfBases(Token); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint airtable GetListOfBases --token %token% --offset %offset%

```

```json title="Result"
{
 "bases": [
 {
 "id": "appGarzKZ0lu3gzoa",
 "name": "Test",
 "permissionLevel": "create"
 },
 {
 "id": "app9WRfJirwn3yXuG",
 "name": "Product catalog",
 "permissionLevel": "create"
 },
 {
 "id": "app6gigUYTzlDEq4X",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "app5hJGyK8asYYe1Q",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "appRQ6VxxOZb40Uwi",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "appM6FaGofV2XSfFA",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "apptm8Xqo7TwMaipQ",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "appsyQyGrF8aVN2Wm",
 "name": "TestDatabase",
 "permissionLevel": "create"
 },
 {
 "id": "applEsyJmBRm12AuN",
 "name": "TestDatabase",
 "permissionLevel": "create"
 }
 ]
 }
```
