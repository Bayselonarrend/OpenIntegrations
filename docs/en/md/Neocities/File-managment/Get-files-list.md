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

    Result = OPI_Neocities.GetFilesList(Token, Path);

    Result = OPI_Neocities.GetFilesList(Token);
```



```sh title="CLI command example"
    
  oint neocities GetFilesList --token "7419cd51de4037f7..." --path %path%

```

```json title="Result"
{
 "result": "success",
 "files": [
  {
   "path": ".nojekyll",
   "is_directory": false,
   "size": 0,
   "created_at": "Mon, 23 Sep 2024 19:58:04 -0000",
   "updated_at": "Mon, 23 Sep 2024 19:58:04 -0000",
   "sha1_hash": "da39a3ee5e6b4b0d3255bfef95601890afd80709"
  },
  {
   "path": "404.html",
   "is_directory": false,
   "size": 7053,
   "created_at": "Mon, 23 Sep 2024 19:57:59 -0000",
   "updated_at": "Tue, 24 Sep 2024 13:47:32 -0000",
   "sha1_hash": "663ec102ebbf671c2b81eba688ee2ad09cf5e6c2"
  },
 ...
```
