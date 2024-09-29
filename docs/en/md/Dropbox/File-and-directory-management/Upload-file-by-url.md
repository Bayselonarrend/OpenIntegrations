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
    Token = "sl.B91EDRcG6KqqbvQ9nc8sWhG3gvHG_3nWIpT8qbct8H-IHRKpi0kUuYPR64_hqVqYmsnnoR7HMj...";
    URL   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);
```



```sh title="CLI command example"
    
  oint dropbox UploadFileByURL --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --url %url% --path %path%

```

```json title="Result"
{
  ".tag": "async_job_id",
  "async_job_id": "41d0vPCn2mYAAAAAAAAAAQ"
  }
```
