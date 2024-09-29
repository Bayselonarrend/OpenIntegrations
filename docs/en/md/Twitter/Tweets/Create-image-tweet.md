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

    Image  = OPI_TestDataRetrieval.GetParameter("Picture"); // URL, Binary or Path to file
    Image2 = OPI_TestDataRetrieval.GetParameter("Picture2"); // URL, Binary or Path to file

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
   "1840435469219209570"
  ],
  "id": "1840435469219209570",
  "text": "TestTweet5638e27b-1d6f-41f9-ab12-ee3f5b28f759"
 }
}
```
