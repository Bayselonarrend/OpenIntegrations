---
sidebar_position: 3
---

# Delete post
 Deletes a post by ID


<br/>


`Function DeletePost(Val PostID, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | PostID | --post | String, Number | Post ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK





```bsl title="Code example"
 Parameters = GetVKParameters();
 PostID = "2304";
 
 Result = OPI_VK.DeletePost(PostID, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk DeletePost --post %post% --auth %auth%

```

```json title="Result"
 {
 "response": 1
}
```
