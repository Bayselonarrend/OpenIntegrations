---
sidebar_position: 1
---

# Create advertising campaign
 Creates a campaign in the selected advertising account


*Function CreateAdvertisingCampaign(Val AccountID, Val Name, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | AccountID | --cabinet | String, Number | Advertising account ID |
 | Name | --title | String | Campaign name |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

```bsl title="Code example"
	
 
 Response = OPI_VK.CreateAdvertisingCampaign(1234567890, "New ads campaign", Parameters);
 Response = OPI_Tools.JSONString(Response);
 
	
```

```sh title="CLI command example"
 
 oint vk CreateAdvertisingCampaign --cabinet %cabinet% --title %title% --auth %auth%

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
