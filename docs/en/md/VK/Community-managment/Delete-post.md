---
sidebar_position: 3
---

# Delete post
 Deletes a post by ID



`Function DeletePost(Val PostID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | PostID | --post | String, Number | Post ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    PostID     = "4578";

    Result = OPI_VK.DeletePost(PostID, Parameters);
```
 



```json title="Result"
{
 "response": 1
}
```
