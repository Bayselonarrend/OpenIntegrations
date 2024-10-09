---
sidebar_position: 4
---

# Write a comment
 Creates a comment under the selected record



`Function WriteComment(Val PostID, Val WallID, Val Text, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | PostID | --post | String, Number | ID of the target post |
  | WallID | --wall | String, Number | ID of the wall where the post is located |
  | Text | --text | String | Comment text |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Text       = "NewComment";
    PostID     = "4479";
    WallID     = Parameters["owner_id"];

    Result = OPI_VK.WriteComment(PostID, WallID, Text, Parameters);
```



```sh title="CLI command example"
    
  oint vk WriteComment --post "3356" --wall "Parameters[owner_id]" --text %text% --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": {
  "comment_id": 4559,
  "parents_stack": []
 }
}
```
