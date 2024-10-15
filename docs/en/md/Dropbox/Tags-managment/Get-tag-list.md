---
sidebar_position: 1
---

# Get list of tags
 Gets the list of tags of the selected files



`Function GetTagList(Val Token, Val Paths) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Paths | --paths | String, Array of String | Path or set of paths to the files |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Result = OPI_Dropbox.GetTagList(Token, PathsArray);
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
