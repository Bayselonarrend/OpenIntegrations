---
sidebar_position: 10
---

# Upload video to server
 Uploads video to the group for further use



`Function UploadVideoToServer(Val Video, Val Name, Val Description = "", Val Album = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Video | --file | String, BinaryData | Video file |
  | Name | --title | String | Video name |
  | Description | --description | String | Video description |
  | Album | --album | String | Album ID, if necessary |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Video       = "https://openintegrations.dev/test_data/video.mp4";
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);
```



```sh title="CLI command example"
    
  oint vk UploadVideoToServer --file "https://openintegrations.dev/test_data/video.mp4" --title %title% --description "Video description" --album %album% --auth "GetVKParameters()"

```

```json title="Result"
  {
  "video_hash": "a833866c6db82314f7",
  "size": 1137878,
  "direct_link": "https://vkvd124.mycdn.me/?expires=1718104740308&srcIp=20.172.5.93&pr=40&srcAg=UNKNOWN&ms=185.226.53.168&type=4&sig=bcm4dKyuOlo&ct=27&urls=45.136.20.202&clientType=14&appId=512000384397&zs=43&id=6569231256185",
  "owner_id": -218861756,
  "video_id": 456239138
  }

```
