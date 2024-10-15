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
    Token = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    File  = "kJU6-a-pT48AAAAAAAAABw";

    Result = OPI_Dropbox.CancelFilePublication(Token, File);
```
 



```json title="Result"
{}
```
