---
sidebar_position: 14
---

# Restore object to version
 Restores object state to required version (revision)


<br/>


`Function RestoreObjectToVersion(Val Token, Val Path, Val Version) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object |
 | Version | --rev | String | ID of the version (revision) for restoration |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
Version = "61a0b76320a6fbd841553";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New/pic.png";
 
 Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);
```
	


```sh title="CLI command example"
 
 oint dropbox RestoreObjectToVersion --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --rev "61a0b76320a6fbd841553"

```

```json title="Result"
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
```
