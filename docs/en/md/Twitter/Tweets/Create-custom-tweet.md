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
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Binary Data or Path to file
    Image2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    MediaArray = OPI_Twitter.UploadAttachmentsArray(ImageArray, "photo", Parameters);
    Result     = OPI_Twitter.CreateCustomTweet(Text, MediaArray, , , Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateCustomTweet --text %text% --media %media% --options %options% --dur %dur% --auth %auth%

```

```json title="Result"
{
 "data": {
  "edit_history_tweet_ids": [
   "1842575245007266294"
  ],
  "text": "TestTweet83829e65-365d-4fc5-8119-226e5ee799f7",
  "id": "1842575245007266294"
 }
}
```
