---
sidebar_position: 8
---

# Copy object
 Copies a file or directory to the selected path



`Function CopyObject(Val Token, Val From, Val Target) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | From | --from | String | Path to the original object |
  | Target | --to | String | Target path for the new object |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";

    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);
```
 



```json title="Result"
{
 "metadata": {
  ".tag": "file",
  "name": "pic_copy.png",
  "path_lower": "/new/pic_copy.png",
  "path_display": "/New/pic_copy.png",
  "id": "id:kJU6-a-pT48AAAAAAAAclQ",
  "client_modified": "2024-10-09T06:15:59Z",
  "server_modified": "2024-10-09T06:16:45Z",
  "rev": "6240532c29927bd841553",
  "size": 2114023,
  "is_downloadable": true,
  "content_hash": "0f3b18c255b0f252bd326cacc04c15c3aa57bd6b8234adb65aa7bb2987a65492"
 }
}
```
