---
sidebar_position: 1
---

# Get object information
 Gets information about a file or directory


*Function GetObjectInformation(Val Token, Val Path, Val Detailed = False) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object |
 | Detailed | --detail | Boolean | Adds additional information fields for media files |

 
 Returns: Key-Value Pair - serialized JSON response from Dropbox 

```bsl title="Code example"
	
 Path = "/New/pic.png"; 
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);

	
```

```sh title="CLI command example"
 
 oint dropbox GetObjectInformation --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --detail %detail%

```


```json title="Result"

{
 ".tag": "file",
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
