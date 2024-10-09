﻿---
sidebar_position: 5
---

# Upload file by URL
 Uploads a file to the cloud drive by fetching it from the specified URL



`Function UploadFileByURL(Val Token, Val FileURL, Val Path) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FileURL | --url | String | URL source of the file |
  | Path | --path | String | Save path on Dropbox |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Path  = "/New/url_doc.docx";
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    URL   = "https://openyellow.neocities.org/test_data/document.docx";

    Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);
```



```sh title="CLI command example"
    
  oint dropbox UploadFileByURL --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --url %url% --path %path%

```

```json title="Result"
{
 ".tag": "async_job_id",
 "async_job_id": "GB72x7EzrHQAAAAAAAAAAQ"
}
```
