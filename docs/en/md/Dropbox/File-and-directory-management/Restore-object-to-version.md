---
sidebar_position: 14
---

# Restore object to version
 Restores object state to required version (revision)



`Function RestoreObjectToVersion(Val Token, Val Path, Val Version) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Path | --path | String | Path to the object |
  | Version | --rev | String | ID of the version (revision) for restoration |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Dropbox

<br/>




```bsl title="Code example"
    Version = "6246a08b887a8bd841553";
    Token   = "sl.B-uquz3utwEHepKzyqLBfnFvmY1EWTYDus5LDjT5ux5srp9PJRtr7CvMv20nVl2rRGC3K4J_X5...";
    Path    = "/New/pic.png";

    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);
```
 



```json title="Result"
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
```
