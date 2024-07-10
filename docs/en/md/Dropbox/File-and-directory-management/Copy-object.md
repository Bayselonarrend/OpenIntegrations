---
sidebar_position: 8
---

# Copy object
 Copies a file or directory to the selected path


<br/>


`Function CopyObject(Val Token, Val From, Val Target) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | From | --form | String | Path to the original object |
 | Target | --to | String | Target path for the new object |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox





```bsl title="Code example"
 Original = "/New/pic.png";
 Copy = "/New/pic_copy.png";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.CopyObject(Token, Original, Copy);
```
	


```sh title="CLI command example"
 
 oint dropbox CopyObject --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --form %form% --to %to%

```

```json title="Result"
 {
 "metadata": {
 ".tag": "file",
 "name": "pic_copy.png",
 "path_lower": "/new/pic_copy.png",
 "path_display": "/New/pic_copy.png",
 "id": "id:kJU6-a-pT48AAAAAAAABYg",
 "client_modified": "2024-05-30T12:32:09Z",
 "server_modified": "2024-05-30T12:32:54Z",
 "rev": "619ab10ed491ebd841553",
 "size": 2114023,
 "is_downloadable": true,
 "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
