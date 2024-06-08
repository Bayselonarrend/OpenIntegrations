---
sidebar_position: 3
---

# Create product selection
 Creates an empty product selection


*Function CreateProductCollection(Val Name, Val Image, Val Main = False, Val Hidden = False, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Selection name |
 | Image | --picture | String, BinaryData | Image file |
 | Main | --main | Boolean | Main |
 | Hidden | --hidden | Boolean | Hidden |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Response = OPI_VK.CreateProductCollection("TestCollection"
, Image
, True
, False
, Parameters);
 
 Response = OPI_Tools.JSONString(Response);
 
	
```

```sh title="CLI command example"
 
 oint vk CreateProductCollection --title %title% --picture %picture% --main %main% --hidden %hidden% --auth %auth%


```


```json title="Result"

{
 "response": {
 "albums_count": 23,
 "market_album_id": 39
 }
 }

```
