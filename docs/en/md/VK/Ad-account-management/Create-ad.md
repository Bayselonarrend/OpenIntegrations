---
sidebar_position: 2
---

# Create advertising post
 Creates an advertising post based on a post


*Function CreateAd(Val CampaignNumber, Val DailyLimit, Val CategoryNumber, Val PostID, Val AccountID, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | CampaignNumber | --campaign | String, Number | Advertising campaign ID |
 | DailyLimit | --limit | String, Number | Daily limit in rubles |
 | CategoryNumber | --category | String, Number | Advertising category number |
 | PostID | --post | String, Number | ID of the post used for advertising |
 | AccountID | --cabinet | String, Number | Advertising account ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Response = OPI_VK.CreateAd(1029683999, 166, 126, 221, 1607951446, Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint vk CreateAd --campaign %campaign% --limit %limit% --category %category% --post %post% --cabinet %cabinet% --auth %auth%


```


```json title="Result"

{
 "response": [
 {
 "id": 171372386
 }
 ]
 }

```
