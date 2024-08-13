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

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters   = GetVKParameters();
    DiscussionID = "51798392";
    Result       = OPI_VK.OpenDiscussion(DiscussionID, Parameters);
```



```sh title="CLI command example"
    
  oint vk OpenDiscussion --topic "51798392" --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": 1
  }

```
