---
sidebar_position: 2
---

# Get list of folder files
 Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified


*Function GetListOfFolderFiles(Val Token, Val Path = "", Val Detailed = False, Val Cursor = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the directory. Optional if the cursor is specified |
 | Detailed | --detail | Boolean | Adds additional information fields for media files |
 | Cursor | --cursor | String | Cursor from the previous request to get the next set of files |

 
 Returns: HTTPResponse - Get list of folder files

```bsl title="Code example"
	
 Path = "/New"; 
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 
 Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);

	
```

```sh title="CLI command example"
 
 oint dropbox GetListOfFolderFiles --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path "/New" --detail %detail% --cursor %cursor%

```


```json title="Result"



```
