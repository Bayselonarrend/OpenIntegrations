---
sidebar_position: 2
---

# Create text tweet
 Creates a tweet without attachments



`Function CreateTextTweet(Val Text, Val Parameters = "") ExportReturn CreateCustomTweet(Text, , , , Parameters);EndFunction`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | Parameters | --auth | Structure Of String | Authorization data. See GetStandardParameters |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);
```
 



```json title="Result"
{
 "data": {
  "edit_history_tweet_ids": [
   "1843891450397839870"
  ],
  "text": "TestTweeteea716eb-0e64-4c2d-b9c9-fb3cca5c6c4e",
  "id": "1843891450397839870"
 }
}
```
