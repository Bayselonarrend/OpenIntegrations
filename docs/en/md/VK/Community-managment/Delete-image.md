﻿---
sidebar_position: 9
---

# Delete image
 Deletes an image from the album



`Function DeleteImage(Val ImageID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ImageID | --pictureid | String, Number | Image ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    ImageID    = "457248905";

    Result = OPI_VK.DeleteImage(ImageID, Parameters);
```



```sh title="CLI command example"
    
  oint vk DeleteImage --pictureid "457246566" --auth "GetVKParameters()"

```

```json title="Result"
{
 "response": 1
}
```
