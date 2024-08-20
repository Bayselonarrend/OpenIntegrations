---
sidebar_position: 1
---

# Like
 Likes a post



`Function LikePost(Val PostID, Val WallID = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | PostID | --post | String, Number | Post ID |
  | WallID | --wall | String, Number | ID of the wall where the post is located |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    PostID     = "3646";

    Result = OPI_VK.LikePost(PostID, , Parameters);
```



```sh title="CLI command example"
    
  oint vk LikePost --post "3356" --wall %wall% --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": {
  "likes": 1
  }
  }
```
