---
sidebar_position: 2
---

# Upload files
 Uploads multiple files to Neocities



`Function UploadFiles(Val Token, Val FileMapping, Val Singly = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | FileMapping | --files | Map Of KeyAndValue | Files: Key > destination path on NC, Value > file |
  | Singly | --singly | Boolean | True > sends files in separate requests |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Token = "7419cd51de4037f7...";

    Image1 = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Path or Binary Data
    Image2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Path or Binary Data
    GIF    = "https://openyellow.neocities.org/test_data/animation.gif"; // URL, Path or Binary Data

    FileMapping = New Map;
    FileMapping.Insert("test/pic1.png", Image1);
    FileMapping.Insert("test/gif.gif" , Image2);
    FileMapping.Insert("pic2.png"     , GIF);

    Result = OPI_Neocities.UploadFiles(Token, FileMapping);
```



```sh title="CLI command example"
    
  oint neocities UploadFiles --token "7419cd51de4037f7..." --files %files% --singly %singly%

```

```json title="Result"
{
 "result": "success",
 "message": "your file(s) have been successfully uploaded"
}
```
