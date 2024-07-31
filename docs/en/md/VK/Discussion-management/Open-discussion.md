---
sidebar_position: 3
---

# Open discussion
 Opens a previously closed discussion



`Function OpenDiscussion(Val DiscussionID, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | DiscussionID | --topic | String, Number | Discussion ID |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 DiscussionID = "51705921";
 Result = OPI_VK.OpenDiscussion(DiscussionID, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk OpenDiscussion --topic %topic% --auth %auth%

```

```json title="Result"
{
 "response": 1
}
```
