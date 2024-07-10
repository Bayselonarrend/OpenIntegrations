---
sidebar_position: 3
---

# Get preview
 Gets PDF or HTML preview of the object (for documents only)


<br/>


`Function GetPreview(Val Token, Val Path) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the object |

 
 Returns: BinaryData - document preview 

<br/>




```bsl title="Code example"
Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New/mydoc.docx";
 
 Result = OPI_Dropbox.GetPreview(Token, Path);
```
	


```sh title="CLI command example"
 
 oint dropbox GetPreview --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%

```

```json title="Result"
NOT JSON: 25 50 44 46 2D 31 2E 35 0D 0A 25 B5 B5 B5 B5 0D 0A 31 20 30 20 6F 62 6A 0D 0A 3C 3C 2F 54 79 70 65 2F 43 61 74 61 6C 6F 67 2F 50 61 67 65 73 20 32 20 30 20 52 2F 4C 61 6E 67 28 65 6E 2D 55 53…
```
