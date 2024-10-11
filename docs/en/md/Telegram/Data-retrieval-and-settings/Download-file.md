---
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

:::tip
Method at API documentation: [getFile](https://core.telegram.org/bots/api#getfile)
:::
<br/>


```bsl title="Code example"
    FileID = "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADcwADNgQ";
    Token  = "6129457865:AAFyzNYOAFbu...";

    Result = OPI_Telegram.DownloadFile(Token, FileID);
```



```sh title="CLI command example"
    
  oint telegram DownloadFile --token "6129457865:AAFyzNYOAFbu..." --fileid "CQACAgIAAx0EcNsaZQACGsRmqTObImcQhvZfQC9f7KStfGzIWwACJFYAAjcMSUk5-shFORxZRjUE"

```

```json title="Result"
NOT JSON: 49 44 33 03 00 00 00 05 1F 76 54 49 54 32 00 00 00 0B 00 00 01 FF FE 44 00 6F 00 67 00 73 00 54 50 45 31 00 00 00 15 00 00 01 FF FE 4D 00 6F 00 74 00 6F 00 72 00 68 00 65 00 61 00 64 00 54 59…
```
