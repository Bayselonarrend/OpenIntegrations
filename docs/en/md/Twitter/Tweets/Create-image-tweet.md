﻿---
sidebar_position: 3
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
  "id": "1843891880246775903",
  "edit_history_tweet_ids": [
   "1843891880246775903"
  ],
  "text": "TestTweet451aa501-9a10-4e00-bcc5-0c3c8d61221a https://t.co/VWvjWsdQHs"
 }
}
```
