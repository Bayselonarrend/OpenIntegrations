---
sidebar_position: 1
---

# Create custom tweet
 Creates a tweet with custom content



`Function CreateCustomTweet(Val Text = "", Val MediaArray = "", Val PollOptionsArray = "", Val PollDuration = "", Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | MediaArray | --media | Array of String, BinaryData | Array of binary data or file paths |
  | PollOptionsArray | --options | Array of String | Array of poll options, if necessary |
  | PollDuration | --dur | String, Number | Poll duration if necessary (poll without duration is not created) |
  | Parameters | --auth | Structure Of String | Authorization data. See GetStandardParameters |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = "https://api.athenaeum.digital/test_data/picture.jpg"; // URL, Binary Data or Path to file
    Image2 = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    MediaArray = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);
    Result     = OPI_Twitter.CreateCustomTweet(Text, MediaArray, , , Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateCustomTweet --text %text% --media %media% --options %options% --dur %dur% --auth %auth%

```

```json title="Result"
{
 "data": {
  "text": "TestTweetd32c4a6d-1279-4adc-a8e8-c86303e1264b",
  "id": "1843892614518501750",
  "edit_history_tweet_ids": [
   "1843892614518501750"
  ]
 }
}
```
