---
sidebar_position: 2
---

# Create image tweet
 Creates a tweet with an image attachment



`Function CreateImageTweet(Val Text, Val ImageArray, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Tweet text |
 | ImageArray | --pictures | Array of String, BinaryData | Image files array |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Twitter

<br/>




```bsl title="Code example"
 
 ImageArray = New Array;
 ImageArray.Add("C:\logo.png");
 ImageArray.Add("C:\logo_long.png");
 
 Response = OPI_Twitter.CreateImageTweet("Alpaca", ImageArray, Parameters);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint twitter CreateImageTweet --text %text% --pictures %pictures% --auth %auth%

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
