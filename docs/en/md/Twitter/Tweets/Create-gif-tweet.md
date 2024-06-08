---
sidebar_position: 3
---

# Create gif tweet
 Creates a tweet with a gif attachment


*Function CreateGifTweet(Val Text, Val GifsArray, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Tweet text |
 | GifsArray | --gifs | Array of String, BinaryData | Gif files array |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Twitter

```bsl title="Code example"
	
 
 ImageArray = New Array;
 ImageArray.Add("C:\1.gif");
 ImageArray.Add("C:\2.gif");
 
 Response = OPI_Twitter.CreateGifTweet("Gifs", ImageArray, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
	
```

```sh title="CLI command example"
 
 oint twitter CreateGifTweet --text %text% --gifs %gifs% --auth %auth%


```


```json title="Result"

{
 "data": {
 "text": "Nature https://t.co/VWkWU11111",
 "id": "1746086669499924991",
 "edit_history_tweet_ids": [
 "1746086669499924991"
 ]
 }
 }

```
