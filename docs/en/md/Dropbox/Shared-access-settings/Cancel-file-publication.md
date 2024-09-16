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
    Token = "sl.B8qNQrapBwdKlUxK9u1kzEIubZPglTP1HW7SS2eULe9E3cG8zqvRiIHoYfVTTG5v0bUTVYp7dX...";
    File  = "kJU6-a-pT48AAAAAAAAABw";

    Result = OPI_Dropbox.CancelFilePublication(Token, File);
```



```sh title="CLI command example"
    
  oint dropbox CancelFilePublication --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --fileid %fileid%

```

```json title="Result"
{}
```
