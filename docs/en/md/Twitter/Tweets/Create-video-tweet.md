---
sidebar_position: 4
---

# Create video tweet
 Creates a tweet with a video attachment


*Function CreateVideoTweet(Val Text, Val VideosArray, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Tweet text |
 | VideosArray | --videos | Array of String, BinaryData | Video files array |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - serialized JSON response from Twitter

```bsl title="Code example"
	
 
 ImageArray = New Array;
 ImageArray.Add("C:\1.mp4");
 ImageArray.Add("C:\2.mp4");
 
 Response = OPI_Twitter.CreateVideoTweet("Nature", ImageArray, Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint twitter CreateVideoTweet --text %text% --videos %videos% --auth %auth%


```


```json title="Result"

{
 "data": {
 "text": "Alpaca https://t.co/OodoWT1AAA",
 "id": "1745753004542726629",
 "edit_history_tweet_ids": [
 "1745753004542726629"
 ]
 }
 }

```
