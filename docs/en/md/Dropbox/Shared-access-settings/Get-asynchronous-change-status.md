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
    Token = "sl.B-q5XQaxJtwx0uMZIwtpBtvwgWmplxOVWNQyY1gbKG31NYy3fDHqe4IuADj33al8uD1l3FYARn...";
    JobID = "dbjid:AABFXDgwbQggiyOnRhhmSt5mv1e1wUaZTgSWf0QEmkH_ID0iNGoqboF2xvZdmGEUzFEPbztCB3chaMBS3k9NnsVc";

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
