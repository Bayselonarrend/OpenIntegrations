﻿---
sidebar_position: 5
---

# Create album
 Creates an album to store images



`Function CreateAlbum(Val Name, Val Description = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Album name |
  | Description | --description | String | Album description |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters  = GetVKParameters();
    Name        = "AlbumFromAutoTest";
    Description = "NewAlbumFromAutoTest";

    Result = OPI_VK.CreateAlbum(Name, Description, Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateAlbum --title "AlbumFromAutoTest" --description %description% --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": {
  "id": 306043366,
  "owner_id": -218861756,
  "size": 0,
  "title": "AlbumFromAutoTest",
  "feed_disabled": 0,
  "feed_has_pinned": 0,
  "can_upload": 1,
  "comments_disabled": 0,
  "created": 1728453690,
  "description": "NewAlbumFromAutoTest",
  "thumb_id": 0,
  "updated": 1728453690,
  "upload_by_admins_only": 1
 }
}
```
