---
sidebar_position: 2
---

# Close discussion
 Close or delete discussion


*Function CloseDiscussion(Val DiscussionID, Val DeleteCompletely = False, Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | DiscussionID | --topic | String, Number | Discussion ID |
 | DeleteCompletely | --remove | Boolean | Delete completely (True) or close |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Key-Value Pair - Serialized JSON response from VK

```bsl title="Code example"
	
 Parameters = GetVKParameters();
 DiscussionID = "51206275";
 Result = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);

	
```

```sh title="CLI command example"
 
 oint vk CloseDiscussion --topic %topic% --remove %remove% --auth %auth%


```


```json title="Result"

{
 "response": 1
}

```
