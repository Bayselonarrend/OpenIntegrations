---
sidebar_position: 9
---

# Move object
 Moves an object to the selected path



`Function MoveObject(Val Token, Val From, Val Target) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | From | --form | String | Path to the original object |
 | Target | --to | String | Target path for the new object |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 OriginalPath = "/New/pic.png";
 TargetPath = "/pic.png";
 Token = "sl.B5DKxgWeuOJQRiKaP3qEV_mcJXoc4byIFf1vAj1olHf6D9wUJRhHVWbXWZwmUYId6zZCWSPgiO...";
 
 Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);
```
	


```sh title="CLI command example"
 
 oint dropbox MoveObject --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --form %form% --to %to%

```

```json title="Result"
{
 "metadata": {
 ".tag": "file",
 "name": "pic.png",
 "path_lower": "/pic.png",
 "path_display": "/pic.png",
 "id": "id:kJU6-a-pT48AAAAAAAAFJA",
 "client_modified": "2024-06-11T18:24:16Z",
 "server_modified": "2024-06-11T18:24:57Z",
 "rev": "61aa16214d7c6bd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
