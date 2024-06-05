---
sidebar_position: 5
---

# Download file
 Download file from Telegram servers


*Function DownloadFile(Val Token, Val FileID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FileID | --fileid | String | File ID for downloading |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 FileID = "AgACAgIAAx0EcNsaZQACE1lmXraQ7CsFNZ2Jrqimp9A0ir3mQQACmtkxG77-sUoMcnd_RvALsgEAAwIAA3MAAzUE";
 Token = "6129457865:AAFyzNYOAFbu...";

 Result = OPI_Telegram.DownloadFile(Token, FileID);

	
```

```sh title="CLI command example"
 
 oint telegram DownloadFile --token "6129457865:AAFyzNYOAFbu..." --fileid "AgACAgIAAx0EcNsaZQACE1lmXraQ7CsFNZ2Jrqimp9A0ir3mQQACmtkxG77-sUoMcnd_RvALsgEAAwIAA3MAAzUE"


```


```json title="Result"

NOT JSON: 49 44 33 03 00 00 00 05 1F 76 54 49 54 32 00 00 00 0B 00 00 01 FF FE 44 00 6F 00 67 00 73 00 54 50 45 31 00 00 00 15 00 00 01 FF FE 4D 00 6F 00 74 00 6F 00 72 00 68 00 65 00 61 00 64 00 54 59…

```
