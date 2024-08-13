---
sidebar_position: 6
---

# Delete album
 Deletes a previously created album



`Function DeleteAlbum(Val AlbumID, Val Parameters = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | AlbumID | --album | String, Number | Album ID |
  | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK

<br/>




```bsl title="Code example"
    Parameters = GetVKParameters();
    AlbumID    = "305187504";

    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);
```



```sh title="CLI command example"
    
  oint vk DeleteAlbum --album "305187504" --auth "GetVKParameters()"

```

```json title="Result"
  {
  "response": 1
  }

```
