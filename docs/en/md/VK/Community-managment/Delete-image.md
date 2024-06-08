---
sidebar_position: 9
---

# Delete image
 Deletes an image from the album


*Function DeleteImage(Val ImageID, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ImageID | --pictureid | String, Number | Image ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 ImageID = "457244340";
 
 Result = OPI_VK.DeleteImage(ImageID, Parameters);
	
```

```sh title="CLI command example"
 
 oint vk DeleteImage --pictureid %pictureid% --auth %auth%


```


```json title="Result"

{
 "response": 1
}

```
