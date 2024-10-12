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

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();

    Video       = "https://api.athenaeum.digital/test_data/video.mp4"; // URL, Binary Data or Path to file
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);
```



```sh title="CLI command example"
    
  oint vk UploadVideoToServer --file "https://openintegrations.dev/test_data/video.mp4" --title %title% --description "Video description" --album %album% --auth "GetVKParameters()"

```

```json title="Result"
{
 "video_hash": "948ffc06db1b09fb7f",
 "size": 1137878,
 "direct_link": "https://vkvd382.okcdn.ru/?expires=1728713194552&srcIp=93.125.42.204&pr=40&srcAg=UNKNOWN&ms=45.136.20.139&type=4&sig=VAfnTuuSNjs&ct=27&urls=45.136.22.139&clientType=14&appId=512000384397&zs=72&id=7195954121353",
 "owner_id": -218861756,
 "video_id": 456239605
}
```
