---
sidebar_position: 10
---

# Upload video to server
 Uploads video to the group for further use


*Function UploadVideoToServer(Val Video, Val Name, Val Description = "", Val Album = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Video | --file | String, BinaryData | Video file |
 | Name | --title | String | Video name |
 | Description | --description | String | Video description |
 | Album | --album | String | Album ID, if necessary |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK 

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint vk UploadVideoToServer --file %file% --title %title% --description %description% --album %album% --auth %auth%


```


```json title="Result"



```
