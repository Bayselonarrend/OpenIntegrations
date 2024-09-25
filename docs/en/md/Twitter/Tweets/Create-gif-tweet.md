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

    GIF  = OPI_TestDataRetrieval.GetParameter("GIF"); // URL, Binary or Path to file
    Gif2 = OPI_TestDataRetrieval.GetParameter("GIF"); // URL, Binary or Path to file

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
  "text": "Nature https://t.co/VWkWU11111",
  "id": "1746086669499924991",
  "edit_history_tweet_ids": [
  "1746086669499924991"
  ]
  }
  }
```
