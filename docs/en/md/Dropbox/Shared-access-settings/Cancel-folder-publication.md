---
sidebar_position: 2
---

# Unpublish folder
 Cancels the public access mode for the directory



`Function CancelFolderPublication(Val Token, Val FolderID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FolderID | --folder | String | ID of the public catalog (shared folder ID) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token  = "sl.B8qNQrapBwdKlUxK9u1kzEIubZPglTP1HW7SS2eULe9E3cG8zqvRiIHoYfVTTG5v0bUTVYp7dX...";
    Folder = "11315516993";

    Result        = OPI_Dropbox.CancelFolderPublication(Token, Folder);
    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    WHile CurrentStatus = "in_progress" Do
        Result          = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus   = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;
```



```sh title="CLI command example"
    
  oint dropbox CancelFolderPublication --token "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ..." --folder %folder%

```

```json title="Result"
{
  ".tag": "complete"
  }
```
