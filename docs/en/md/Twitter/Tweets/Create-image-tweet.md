---
sidebar_position: 2
---

# Create image tweet
 Creates a tweet with an image attachment



`Function CreateImageTweet(Val Text, Val ImageArray, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | ImageArray | --pictures | Array of String, BinaryData | Image files array |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image  = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Binary or Path to file
    Image2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Binary or Path to file

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.CreateImageTweet(Text, ImageArray, Parameters);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateImageTweet --text %text% --pictures %pictures% --auth %auth%

```

```json title="Result"
{
 "data": {
  "edit_history_tweet_ids": [
   "1842574235090215108"
  ],
  "text": "TestTweet47ebc1d8-c18c-47a6-a1fd-ccc59aca9a15",
  "id": "1842574235090215108"
 }
}
```
