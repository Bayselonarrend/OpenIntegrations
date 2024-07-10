---
sidebar_position: 10
---

# Create folder
 Creates an empty directory at the selected path


<br/>


`Function CreateFolder(Val Token, Val Path) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Target path for creating the directory |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New catalog";
 
 Result = OPI_Dropbox.CreateFolder(Token, Path);
```
	


```sh title="CLI command example"
 
 oint dropbox CreateFolder --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%

```

```json title="Result"
{
 "metadata": {
 "name": "New catalog",
 "path_lower": "/new catalog",
 "path_display": "/New catalog",
 "id": "id:kJU6-a-pT48AAAAAAAABZA"
 }
}
```
