---
sidebar_position: 2
---

# Add tag
 Add new tag to file or folder


<br/>


`Function AddTag(Val Token, Val Path, Val Tag) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object for which the tag needs to be created |
 | Tag | --tag | String | Tag text |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




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
