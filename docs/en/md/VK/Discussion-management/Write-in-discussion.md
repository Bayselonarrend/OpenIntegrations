---
sidebar_position: 4
---

# Write in discussion
 Adds a message to the discussion on behalf of the group



`Function WriteInDiscussion(Val DiscussionID, Val Text, Val Parameters = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | DiscussionID | --topic | String, Number | Discussion ID |
 | Text | --text | String | Message text |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
 Parameters = GetVKParameters();
 DiscussionID = "51798392";
 Message = "I like yellow more";
 
 Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);
```
	


```sh title="CLI command example"
 
 oint vk WriteInDiscussion --topic %topic% --text %text% --auth %auth%

```

```json title="Result"
{
 "response": 705
}
```
