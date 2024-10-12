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
  | Parameters | --auth | Structure Of String | Authorization data. See GetStandardParameters |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = "https://api.athenaeum.digital/test_data/video.mp4"; // URL, Binary or Path to file
    Video2 = "https://api.athenaeum.digital/test_data/video.mp4"; // URL, Binary or Path to file

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
 "data": {
  "edit_history_tweet_ids": [
   "1843891542655709641"
  ],
  "id": "1843891542655709641",
  "text": "TestTweet9e678e5d-a3b4-4775-a584-75094c588bfa https://t.co/kYlj98ZsLS"
 }
}
```
