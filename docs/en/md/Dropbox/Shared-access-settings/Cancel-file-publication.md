---
sidebar_position: 6
---

# Unpublish file
 Prohibits access to the file for external users



`Function CancelFilePublication(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FileID | --fileid | String | ID of the file to be accessed |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
  Token = FunctionParameters["Dropbox_Token"];
  File  = FunctionParameters["Dropbox_FileID"];
  
  Result = OPI_Dropbox.CancelFilePublication(Token, File);
```



```sh title="CLI command example"
    
  oint dropbox CancelFilePublication --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --fileid %fileid%

```

```json title="Result"
{}
```
