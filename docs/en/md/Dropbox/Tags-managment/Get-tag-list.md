---
sidebar_position: 1
---

# Get list of tags
 Gets the list of tags of the selected files


*Function GetTagList(Val Token, Val Paths) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Paths | --paths | String, Array of String | Path or set of paths to the files |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint dropbox GetTagList --token %token% --paths %paths%


```


```json title="Result"

{
 "paths_to_tags": [
 {
 "path": "/New/Dogs.mp3",
 "tags": []
 },
 {
 "path": "/New/mydoc.docx",
 "tags": [
 {
 ".tag": "user_generated_tag",
 "tag_text": "important"
 }
 ]
 }
 ]
}

```
