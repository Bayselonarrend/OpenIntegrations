---
sidebar_position: 5
---

# Create poll tweet
 Creates a tweet with a poll



`Function CreatePollTweet(Val Text, Val OptionArray, Val Duration, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Tweet text |
  | OptionArray | --options | Array of String | Poll options array |
  | Duration | --duration | String, Number | Poll duration |
  | Parameters | --auth | Structure Of String | Auth data or path to .json file |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);
```



```sh title="CLI command example"
    
  oint twitter CreatePollTweet --text %text% --options %options% --duration %duration% --auth %auth%

```

```json title="Result"
{
 "data": {
  "text": "TestTweet7fa6f657-7cab-4959-803c-6e3812e3f521",
  "edit_history_tweet_ids": [
   "1840436352439005253"
  ],
  "id": "1840436352439005253"
 }
}
```
