---
sidebar_position: 5
---

# Create video tweet
 Creates a tweet with a video attachment



`Function CreateVideoTweet(Val Text, Val VideosArray, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | VideosArray | --videos | Array of String, BinaryData | Video files array |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = "https://openyellow.neocities.org/test_data/video.mp4"; // URL, Binary or Path to file
    Video2 = "https://openyellow.neocities.org/test_data/video.mp4"; // URL, Binary or Path to file

    VideosArray = New Array;
    VideosArray.Add(Video);
    VideosArray.Add(Video2);

    Result = OPI_Twitter.CreateVideoTweet(Text, VideosArray, Parameters);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateVideoTweet --text %text% --videos %videos% --auth %auth%

```

```json title="Result"
{
 "errors": [
  {
   "parameters": {
    "media.media_ids": [
     "1843365521481187328",
     "1843365537839017984"
    ]
   },
   "message": "Your media IDs are invalid."
  }
 ],
 "title": "Invalid Request",
 "detail": "One or more parameters to your request was invalid.",
 "type": "https://api.twitter.com/2/problems/invalid-request"
}
```
