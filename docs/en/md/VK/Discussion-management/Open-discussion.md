---
sidebar_position: 3
---

# Open discussion
 Opens a previously closed discussion



`Function OpenDiscussion(Val DiscussionID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | DiscussionID | --topic | String, Number | Discussion ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters   = GetVKParameters();
    DiscussionID = "52583592";
    Result       = OPI_VK.OpenDiscussion(DiscussionID, Parameters);
```
 



```json title="Result"
{
 "response": 1
}
```
