---
sidebar_position: 5
---

# Get asynchronous change status
 Get async job status for access changes




<br/>


*Function GetAsynchronousChangeStatus(Val Token, Val JobID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | JobID | --job | String | AsynchronousJobID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox


	


```sh title="CLI command example"
 
 oint dropbox GetAsynchronousChangeStatus --token %token% --job %job%

```


