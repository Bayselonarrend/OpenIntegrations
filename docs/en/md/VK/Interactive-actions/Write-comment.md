---
sidebar_position: 4
---

# Write a comment
 Creates a comment under the selected record



`Function WriteComment(Val PostID, Val WallID, Val Text, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | PostID | --post | String, Number | ID of the target post |
 | WallID | --wall | String, Number | ID of the wall where the post is located |
 | Text | --text | String | Comment text |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 Text = "NewComment";
 PostID = "3356";
 WallID = Parameters["owner_id"];
 
 Result = OPI_VK.WriteComment(PostID, WallID, Text, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk WriteComment --post %post% --wall %wall% --text %text% --auth %auth%

```

```json title="Result"
{
 "response": {
 "parents_stack": [],
 "comment_id": 229
 }
 }
```
