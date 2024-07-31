---
sidebar_position: 6
---

# Unpublish file
 Prohibits access to the file for external users



`Function CancelFilePublication(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | FileID | --fileid | String | ID of the file to be accessed |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B5DKxgWeuOJQRiKaP3qEV_mcJXoc4byIFf1vAj1olHf6D9wUJRhHVWbXWZwmUYId6zZCWSPgiO...";
 File = "kJU6-a-pT48AAAAAAAAABw";
 
 Result = OPI_Dropbox.CancelFilePublication(Token, File);
```
	


```sh title="CLI command example"
 
 oint dropbox CancelFilePublication --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --fileid %fileid%

```

```json title="Result"
{}
```
