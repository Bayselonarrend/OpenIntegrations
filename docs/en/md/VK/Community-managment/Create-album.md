---
sidebar_position: 5
---

# Create album
 Creates an album to store images


*Function CreateAlbum(Val Name, Val Description = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Name | --title | String | Album name |
 | Description | --description | String | Album description |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 Name = "AlbumFromAutoTest";
 Description = "NewAlbumFromAutoTest";
 
 Result = OPI_VK.CreateAlbum(Name, Description, Parameters);
	
```

```sh title="CLI command example"
 
 oint vk CreateAlbum --title %title% --description %description% --auth %auth%

```


```json title="Result"

{
 "response": {
 "id": 304498513,
 "owner_id": -218861756,
 "size": 0,
 "title": "AlbumFromAutoTest",
 "feed_disabled": 0,
 "feed_has_pinned": 0,
 "can_upload": 1,
 "comments_disabled": 0,
 "created": 1717072416,
 "description": "NewAlbumFromAutoTest",
 "thumb_id": 0,
 "updated": 1717072416,
 "upload_by_admins_only": 1
 }
}

```
