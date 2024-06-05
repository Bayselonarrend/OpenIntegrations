---
sidebar_position: 3
---

# Delete tag
 Deletes the text tag of a file or directory


*Function DeleteTag(Val Token, Val Path, Val Tag) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object whose tag needs to be deleted |
 | Tag | --tag | String | Tag text |

 
 Returns: Key-Value Pair - serialized JSON response from Dropbox

```bsl title="Code example"
	
 Tag = "Important";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New/mydoc.docx"; 
 
 Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);
 
	
```

```sh title="CLI command example"
 
 oint dropbox DeleteTag --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --tag %tag%


```


```json title="Result"

{}

```
