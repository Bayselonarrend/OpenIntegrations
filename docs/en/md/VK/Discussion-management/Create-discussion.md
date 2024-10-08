﻿---
sidebar_position: 1
---

# Create discussion
 Creates a new discussion



`Function CreateDiscussion(Val Name, Val FirstMessageText, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Discussion name |
  | FirstMessageText | --text | String | Text of the first message |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    Name       = "Discussing: Which color is better?";
    Message    = "Red, yellow, blue, or some other?";

    Result = OPI_VK.CreateDiscussion(Name, Message, Parameters);
```



```sh title="CLI command example"
    
  oint vk CreateDiscussion --title "Discussing: Which color is better?" --text %text% --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": 52573385
}
```
