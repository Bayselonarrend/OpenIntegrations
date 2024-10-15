---
sidebar_position: 2
---

# Make repost
 Reposts the record



`Function MakeRepost(Val PostID, Val WallID = "", Val TargetWall = "", Val Advertising = False, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | PostID | --post | String, Number | Post ID |
  | WallID | --from | String, Number | ID of the wall where the post is located |
  | TargetWall | --to | String, Number | ID of the target wall or group |
  | Advertising | --ad | Boolean | Sign of an advertising post |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Result = OPI_VK.MakeRepost(PostID, WallID, , , Parameters);
```
 



```json title="Result"
{
 "response": {
  "success": 1,
  "post_id": 4558,
  "reposts_count": 3,
  "likes_count": 10,
  "wall_repost_count": 1,
  "mail_repost_count": 2,
  "badges": {
   "type": 11,
   "id": 2571,
   "owner_id": -218704372
  }
 }
}
```
