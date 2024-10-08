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

    Video       = "https://openyellow.neocities.org/test_data/video.mp4"; // URL, Binary Data or Path to file
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);
```



```sh title="CLI command example"
    
  oint vk UploadVideoToServer --file "https://openintegrations.dev/test_data/video.mp4" --title %title% --description "Video description" --album %album% --auth "GetVKParameters()"

```

```json title="Result"
{
 "video_hash": "a9561140da8c49bfe3",
 "size": 1137878,
 "direct_link": "https://vkvd263.mycdn.me/?expires=1728587520918&srcIp=93.125.42.204&pr=40&srcAg=UNKNOWN&ms=45.136.20.184&type=4&sig=3VPMidseyBw&ct=27&urls=185.226.53.166&clientType=14&appId=512000384397&zs=72&id=7039644600933",
 "owner_id": -218861756,
 "video_id": 456239599
}
```
