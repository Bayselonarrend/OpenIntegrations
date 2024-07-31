---
sidebar_position: 13
---

# Get list of object versions
 Gets the list of versions (revisions) of the object



`Function GetObjectVersionList(Val Token, Val Path, Val Count = 10) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object |
 | Count | --amount | String, Number | Number of the latest versions of the object to display |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B5DKxgWeuOJQRiKaP3qEV_mcJXoc4byIFf1vAj1olHf6D9wUJRhHVWbXWZwmUYId6zZCWSPgiO...";
 Path = "/New/pic.png";
 
 Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);
```
	


```sh title="CLI command example"
 
 oint dropbox GetObjectVersionList --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --amount %amount%

```

```json title="Result"
{
 "is_deleted": false,
 "entries": [
 {
 "name": "pic.png",
 "path_lower": "/new/pic.png",
 "path_display": "/New/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAABYA",
 "client_modified": "2024-05-30T12:32:09Z",
 "server_modified": "2024-05-30T12:32:09Z",
 "rev": "619ab0e44a57cbd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
 ]
}
```
