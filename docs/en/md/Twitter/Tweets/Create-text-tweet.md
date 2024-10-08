---
sidebar_position: 2
---

# Create text tweet
 Creates a tweet without attachments



`Function CreateTextTweet(Val Text, Val Parameters = "") ExportReturn CreateCustomTweet(Text, , , , Parameters);EndFunction`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreateTextTweet --text %text% --auth %auth%

```

```json title="Result"
{
 "data": {
  "id": "1843365449821499430",
  "text": "TestTweet862418b2-c1b0-43ff-b47a-ef8a2a12ae77",
  "edit_history_tweet_ids": [
   "1843365449821499430"
  ]
 }
}
```
