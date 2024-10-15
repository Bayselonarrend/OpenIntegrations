---
sidebar_position: 13
---

# Get list of object versions
 Gets the list of versions (revisions) of the object



`Function GetObjectVersionList(Val Token, Val Path, Val Count = 10) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object |
  | Count | --amount | String, Number | Number of the latest versions of the object to display |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);
```
 



```json title="Result"
{
 "is_deleted": false,
 "entries": [
  {
   "name": "pic.png",
   "path_lower": "/new/pic.png",
   "path_display": "/New/pic.png",
   "id": "id:kJU6-a-pT48AAAAAAAAckw",
   "client_modified": "2024-10-09T06:15:59Z",
   "server_modified": "2024-10-09T06:15:59Z",
   "rev": "62405300c4139bd841553",
   "size": 2114023,
   "is_downloadable": true,
   "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
  }
 ]
}
```
