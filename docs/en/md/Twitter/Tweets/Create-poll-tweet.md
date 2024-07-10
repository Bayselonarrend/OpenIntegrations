---
sidebar_position: 5
---

# Create poll tweet
 Creates a tweet with a poll



`Function CreatePollTweet(Val Text, Val OptionArray, Val Duration, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Tweet text |
 | OptionArray | --options | Array of String | Poll options array |
 | Duration | --duration | String, Number | Poll duration |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
 
 OptionArray = New Array;
 OptionArray.Add("Good");
 OptionArray.Add("Nothing special");
 OptionArray.Add("Bad");
 
 Response = OPI_Twitter.CreatePollTweet("How are you?", OptionArray, 60, Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint twitter CreatePollTweet --text %text% --options %options% --duration %duration% --auth %auth%

```

```json title="Result"
{
 "data": {
 "text": "How are you?",
 "id": "1746082302268969388",
 "edit_history_tweet_ids": [
 "1746082302268969388"
 ]
 }
 }
```
