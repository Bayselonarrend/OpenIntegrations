---
sidebar_position: 2
---

# Unpublish folder
 Cancels the public access mode for the directory



`Function CancelFolderPublication(Val Token, Val FolderID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FolderID | --folder | String | ID of the public catalog (shared folder ID) |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B6AQWp9MlZlz4iaf41whVKxX9-MXeCiQhPRe4YIRxFmZ3zHsdjmOAatzgaWVhqmlIOvDD6WIUQ...";
 Folder = "3417285987";
 
 Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);
 CurrentStatus = "in_progress";
 JobID = Result["async_job_id"];
 
 WHile CurrentStatus = "in_progress" Do
 Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
 CurrentStatus = Result[".tag"];
 OPI_Tools.Pause(3);
 EndDo;
```
	


```sh title="CLI command example"
 
 oint dropbox CancelFolderPublication --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --folder %folder%

```

```json title="Result"
{
 ".tag": "complete"
}
```
