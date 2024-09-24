---
sidebar_position: 3
---

# Delete selected files
 Deletes a file or multiple files from Neocities



`Function DeleteSelectedFiles(Val Token, Val Paths) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | Paths | --paths | String, Array of String | Path or multiple paths of the files to be deleted |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Token = "7419cd51de4037f7...";

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, Paths);
```



```sh title="CLI command example"
    
  oint neocities DeleteSelectedFiles --token "7419cd51de4037f7..." --paths %paths%

```

```json title="Result"
{
 "result": "success",
 "message": "file(s) have been deleted"
}
```
