---
sidebar_position: 4
---

# Get list of files
 Gets a list of files with or without directory selection



`Function GetFilesList(Val Token, Val Path = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | Path | --path | String | Selection of files by catalog. All if not filled in |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Token = "7419cd51de4037f7...";
    Path  = "test";

    Result = OPI_Neocities.GetFilesList(Token);

    Result = OPI_Neocities.GetFilesList(Token, Path);
```



```sh title="CLI command example"
    
  oint neocities GetFilesList --token "7419cd51de4037f7..." --path %path%

```

```json title="Result"

```
