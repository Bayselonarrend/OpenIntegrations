---
sidebar_position: 5
---

# Download file
 Download file from Telegram servers



`Function DownloadFile(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FileID | --fileid | String | File ID for downloading |

 
 Returns: BinaryData - file's binary data

<br/>




```bsl title="Code example"
 FileID = "AgACAgIAAx0EcNsaZQACE1lmXraQ7CsFNZ2Jrqimp9A0ir3mQQACmtkxG77-sUoMcnd_RvALsgEAAwIAA3MAAzUE";
 Token = "6129457865:AAFyzNYOAFbu...";
 
 Result = OPI_Telegram.DownloadFile(Token, FileID);
```
	


```sh title="CLI command example"
 
 oint telegram DownloadFile --token "6129457865:AAFyzNYOAFbu..." --fileid "AgACAgIAAx0EcNsaZQACE1lmXraQ7CsFNZ2Jrqimp9A0ir3mQQACmtkxG77-sUoMcnd_RvALsgEAAwIAA3MAAzUE"

```

```json title="Result"
<Binary file's binary data>
```
