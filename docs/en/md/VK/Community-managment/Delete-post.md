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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    PostID     = "3356";

    Result = OPI_VK.DeletePost(PostID, Parameters);
```



```sh title="CLI command example"
    
  oint vk DeletePost --post "3356" --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": 1
  }

```
