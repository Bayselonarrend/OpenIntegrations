---
sidebar_position: 3
---

# Pause advertising post
 Pauses the display of the advertising post


*Function PauseAdvertisingAd(Val AccountID, Val AdID, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | AccountID | --cabinet | String, Number | Advertising account ID |
 | AdID | --adv | String, Number | Ad ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Response = OPI_VK.PauseAdvertisingAd(1234567890, 1029701085, Parameters);
 Response = OPI_Tools.JSONString(Response);
 

	
```

```sh title="CLI command example"
 
 oint vk PauseAdvertisingAd --cabinet %cabinet% --adv %adv% --auth %auth%


```


```json title="Result"

{
 "response": [
 {
 "id": 1029701085
 }
 ]
 }

```
