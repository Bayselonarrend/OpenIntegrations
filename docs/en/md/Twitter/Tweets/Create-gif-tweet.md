---
sidebar_position: 3
---

# Create gif tweet
 Creates a tweet with a gif attachment



`Function CreateGifTweet(Val Text, Val GifsArray, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | GifsArray | --gifs | Array of String, BinaryData | Gif files array |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = "https://openyellow.neocities.org/test_data/animation.gif"; // URL, Binary or Path to file
    Gif2 = "https://openyellow.neocities.org/test_data/animation.gif"; // URL, Binary or Path to file

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
  "id": "1842574854089740736",
  "edit_history_tweet_ids": [
   "1842574854089740736"
  ],
  "text": "TestTweet2737de69-ee74-4605-8eae-1ce90a19b93a"
 }
}
```
