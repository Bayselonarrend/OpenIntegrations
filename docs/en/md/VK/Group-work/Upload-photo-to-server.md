---
sidebar_position: 11
---

# Upload photo to server
 Uploads photo to server for further use


*Function UploadPhotoToServer(Val Image, Val Parameters = "", Val View = "Post") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Image | --file | String, BinaryData | Image file |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |
 | View | --type | String | Upload type (Post, Product, Story, Poll, Other) |

 
 Returns: Key-Value Pair - Serialized JSON response from VK 

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint vk UploadPhotoToServer --file %file% --auth %auth% --type %type%

```


```json title="Result"



```
