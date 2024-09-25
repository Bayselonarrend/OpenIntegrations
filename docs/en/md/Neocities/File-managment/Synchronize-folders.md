---
sidebar_position: 5
---

# Synchronize folders
 Creates a copy of the local directory at the selected path on the Neocities server



`Function SynchronizeFolders(Val Token, Val LocalFolder, Val RemoteFolder = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | LocalFolder | --local | String | Local source catalog |
  | RemoteFolder | --remote | String | Remote receiver catalog. Root by default |

  
  Returns:  Structure of KeyAndValue - synchronization error information

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)

 The method deletes files on the server if they do not exist in the local directory
:::
<br/>


```bsl title="Code example"
    Token = "7419cd51de4037f7...";

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Result = OPI_Neocities.SynchronizeFolders(Token, LocalFolder, RemoteFolder);
```



```sh title="CLI command example"
    
  oint neocities SynchronizeFolders --token "7419cd51de4037f7..." --local %local% --remote %remote%

```

```json title="Result"
{
 "errors": 0,
 "items": []
}
```
