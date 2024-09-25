﻿---
sidebar_position: 5
---

# Download file
 Download file from Telegram servers



`Function DownloadFile(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FileID | --fileid | String | File ID for downloading |

  
  Returns:  BinaryData - file's binary data

<br/>




```bsl title="Code example"
    FileID = "CQACAgIAAx0EcNsaZQACIddm9EV1lD73J6igOmZkEuKUt1TTEQACamQAAgguoUs67b2L3FD4jjYE";
    Token  = "6129457865:AAFyzNYOAFbu...";

    Result = OPI_Telegram.DownloadFile(Token, FileID);
```



```sh title="CLI command example"
    
  oint telegram DownloadFile --token "6129457865:AAFyzNYOAFbu..." --fileid "CQACAgIAAx0EcNsaZQACGsRmqTObImcQhvZfQC9f7KStfGzIWwACJFYAAjcMSUk5-shFORxZRjUE"

```

```json title="Result"
<Binary file's binary data>
```
