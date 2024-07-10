---
sidebar_position: 3
---

# Pause advertising post
 Pauses the display of the advertising post




<br/>


*Function PauseAdvertising(Val AccountID, Val AdID, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | AccountID | --cabinet | String, Number | Advertising account ID |
 | AdID | --adv | String, Number | Ad ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK


```bsl title="Code example"
 
 Response = OPI_VK.PauseAdvertising(1234567890, 1029701085, Parameters);
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk PauseAdvertising --cabinet %cabinet% --adv %adv% --auth %auth%

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
