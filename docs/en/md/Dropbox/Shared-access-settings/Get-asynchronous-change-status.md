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
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    JobID = "dbjid:AADns14EdwZ4C7QvhwyHagmhHDv0r9IZCiglKB53j4cCgdIdcTY_UmDI1kiW4szDJU-p3QWJLwmCsWPeLh_pxglp";

    Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
```
 



```json title="Result"
{
 ".tag": "complete"
}
```
