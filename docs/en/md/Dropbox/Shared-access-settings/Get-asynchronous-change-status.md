---
sidebar_position: 5
---

# Get asynchronous change status
 Get async job status for access changes



`Function GetAsynchronousChangeStatus(Val Token, Val JobID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | JobID | --job | String | AsynchronousJobID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B9sYGdZdLILSnqlGZCwLFCstq1B1GsgevbBkwi4UK_UlNyhGAoJ1fKoXMy3dQhkEb3e80HTL6g...";
    JobID = "";

    Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
```



```sh title="CLI command example"
    
  oint dropbox GetAsynchronousChangeStatus --token %token% --job %job%

```

```json title="Result"
{
 ".tag": "complete"
}
```
