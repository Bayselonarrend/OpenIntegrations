---
sidebar_position: 2
---

# Close discussion
 Close or delete discussion



`Function CloseDiscussion(Val DiscussionID, Val DeleteCompletely = False, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | DiscussionID | --topic | String, Number | Discussion ID |
  | DeleteCompletely | --remove | Boolean | Delete completely (True) or close |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
  Parameters   = GetVKParameters();
  DiscussionID = "51798392";
  Result       = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);
```



```sh title="CLI command example"
    
  oint vk CloseDiscussion --topic "51798392" --remove %remove% --auth "GetVKParameters()"

```

```json title="Result"
{
  "response": 1
  }
```
