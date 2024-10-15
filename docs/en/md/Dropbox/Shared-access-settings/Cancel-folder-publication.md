---
sidebar_position: 2
---

# Unpublish folder
 Cancels the public access mode for the directory



`Function CancelFolderPublication(Val Token, Val FolderID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | FolderID | --folder | String | ID of the public catalog (shared folder ID) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token  = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Folder = "11705714929";

    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);
```
 



```json title="Result"
{
 ".tag": "async_job_id",
 "async_job_id": "dbjid:AABIL_Y3eWbNQjjcels4kLWmUwVyjbJ-P7WpZzl6jIq3_fb2oSve73rWjYkC5VFtf8SOK2kP67Ms--L0g4pcUNzO"
}
```
