---
sidebar_position: 4
---

# Create gif tweet
 Creates a tweet with a gif attachment



`Function CreateGifTweet(Val Text, Val GifsArray, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | GifsArray | --gifs | Array of String, BinaryData | Gif files array |
  | Parameters | --auth | Structure Of String | Authorization data. See GetStandardParameters |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = "https://api.athenaeum.digital/test_data/animation.gif"; // URL, Binary or Path to file
    Gif2 = "https://api.athenaeum.digital/test_data/animation.gif"; // URL, Binary or Path to file

    GifsArray = New Array;
    GifsArray.Add(GIF);
    GifsArray.Add(Gif2);

    Result = OPI_Twitter.CreateGifTweet(Text, GifsArray, Parameters);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateGifTweet --text %text% --gifs %gifs% --auth %auth%

```

```json title="Result"
{
 "data": {
  "text": "TestTweet27989425-2fb9-4d49-ac50-2b73dff7c69e https://t.co/m6q4Bzxea3",
  "id": "1843892227023507612",
  "edit_history_tweet_ids": [
   "1843892227023507612"
  ]
 }
}
```
