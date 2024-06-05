---
sidebar_position: 2
---

# Add tag
 Adds a new text tag to a file or directory


*Function AddTag(Val Token, Val Path, Val Tag) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object for which the tag needs to be created |
 | Tag | --tag | String | Tag text |

 
 Returns: Key-Value Pair - serialized JSON response from Dropbox

```bsl title="Code example"
	
 Tag = "Important";
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New/mydoc.docx"; 
 
 Result = OPI_Dropbox.AddTag(Token, Path, Tag);

	
```

```sh title="CLI command example"
 
 oint dropbox AddTag --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path% --tag %tag%


```


```json title="Result"

{}

```
