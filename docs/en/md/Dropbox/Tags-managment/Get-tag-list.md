---
sidebar_position: 1
---

# Get list of tags
 Gets the list of tags of the selected files


<br/>


`Function GetTagList(Val Token, Val Paths) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Paths | --paths | String, Array of String | Path or set of paths to the files |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
 Token = "sl.B22821SXrkmxs9KAaC6M_ax_M33mEcEvKz9sqgcMO8Xwn0bvpx4_57UQqLR_gEuPS_Yk5yd3Tv...";
 
 PathsArray = New Array;
 PathsArray.Add("/New/Dogs.mp3");
 PathsArray.Add("/New/mydoc.docx");
 
 Result = OPI_Dropbox.GetTagList(Token, PathsArray);
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
