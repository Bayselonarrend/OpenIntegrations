---
sidebar_position: 9
---

# Move object
 Moves an object to the selected path


*Function MoveObject(Val Token, Val From, Val Target) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | From | --form | String | Path to the original object |
 | Target | --to | String | Target path for the new object |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

```bsl title="Code example"
	
 OriginalPath = "/New/pic.png";
 TargetPath = "/pic.png"; 
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);
 
	
```

```sh title="CLI command example"
 
 oint dropbox MoveObject --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --form %form% --to %to%


```


```json title="Result"



```
