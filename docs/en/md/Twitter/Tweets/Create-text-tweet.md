---
sidebar_position: 1
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
  "id": "1840435412147355972",
  "edit_history_tweet_ids": [
   "1840435412147355972"
  ],
  "text": "TestTweet6ccd2da8-de87-4b65-9635-34dc904f8c60"
 }
}
```
