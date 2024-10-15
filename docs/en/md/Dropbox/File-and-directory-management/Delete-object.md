---
sidebar_position: 7
---

# Delete object
 Deletes an object from the cloud drive



`Function DeleteObject(Val Token, Val Path, Val Irrecoverable = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object to delete |
  | Irrecoverable | --permanently | String | Delete object without the possibility of recovery |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Path  = "/New/pic.png";
    Token = "sl.B-iqyqXWh8YCVSZnVG0BwXxLlHNbfCDJrGlOyhjKnx1cAwPeSV71gjqQ1iR0QLna032Hn-HZjE...";

    Result = OPI_Dropbox.DeleteObject(Token, Path);
```
 



```json title="Result"
{
 "metadata": {
  ".tag": "file",
  "name": "pic.png",
  "path_lower": "/new/pic.png",
  "path_display": "/New/pic.png",
  "id": "id:kJU6-a-pT48AAAAAAAAckw",
  "client_modified": "2024-10-09T06:15:59Z",
  "server_modified": "2024-10-09T06:16:39Z",
  "rev": "624053263b1b1bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
