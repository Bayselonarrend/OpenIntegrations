---
sidebar_position: 1
---

# Upload file
 Upload single file to Neocities



`Function UploadFile(Val Token, Val Path, Val Data) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Auth token |
  | Path | --path | String | File path on Neocities |
  | Data | --file | String, BinaryData | URL, path or file data |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Neocities

<br/>

:::tip
Neocities API docs: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Code example"
    Token = "7419cd51de4037f7...";
    Data  = "https://openyellow.neocities.org/test_data/picture.jpg"; // URL, Path or Binary Data
    Path  = "testfolder/test_pic.png";

    Result = OPI_Neocities.UploadFile(Token, Path, Data);
```



```sh title="CLI command example"
    
  oint neocities UploadFile --token "7419cd51de4037f7..." --path %path% --file "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg"

```

```json title="Result"
{
 "result": "success",
 "message": "your file(s) have been successfully uploaded"
}
```
