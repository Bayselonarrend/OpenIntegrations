---
sidebar_position: 2
---

# Make repost
 Reposts the record



`Function MakeRepost(Val PostID, Val WallID = "", Val TargetWall = "", Val Advertising = False, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | PostID | --post | String, Number | Post ID |
 | WallID | --from | String, Number | ID of the wall where the post is located |
 | TargetWall | --to | String, Number | ID of the target wall or group |
 | Advertising | --ad | Boolean | Sign of an advertising post |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 
 Response = OPI_VK.MakeRepost(2571, -218704372,,, Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint vk MakeRepost --post %post% --from %from% --to %to% --ad %ad% --auth %auth%

```

```json title="Result"
{
 "response": {
 "mail_repost_count": 2,
 "likes_count": 7,
 "reposts_count": 3,
 "post_id": 228,
 "badges": {
 "owner_id": -218704372,
 "id": 2571,
 "type": 11
 },
 "wall_repost_count": 1,
 "success": 1
 }
 }
```
