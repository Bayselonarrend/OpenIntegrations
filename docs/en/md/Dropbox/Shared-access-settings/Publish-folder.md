---
sidebar_position: 1
---

# Publish folder
 Sets the directory to public access mode


*Function PublishFolder(Val Token, Val Path) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Path | --path | String | Path to the target directory |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Dropbox

```bsl title="Code example"
	
 Token = "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L...";
 Path = "/New";
 
 Result = OPI_Dropbox.PublishFolder(Token, Path);
	
```

```sh title="CLI command example"
 
 oint dropbox PublishFolder --token "sl.B2ieEHcB9I9BTwJFjbf_MQtoZMKjGYgkpBqzQkvBfuSz41Qpy5r3d7a4ax22I5ILWhd9KLbN5L..." --path %path%


```


```json title="Result"

{
 ".tag": "complete",
 "access_type": {
 ".tag": "owner"
 },
 "is_inside_team_folder": false,
 "is_team_folder": false,
 "path_display": "/New",
 "path_lower": "/new",
 "name": "New",
 "policy": {
 "acl_update_policy": {
 ".tag": "editors"
 },
 "shared_link_policy": {
 ".tag": "anyone"
 },
 "viewer_info_policy": {
 ".tag": "enabled"
 }
 },
 "preview_url": "https://www.dropbox.com/scl/fo/0eu3zz5f05vymefoq6yyl/h?dl=0",
 "shared_folder_id": "5009428129",
 "time_invited": "2024-05-30T12:35:34Z",
 "access_inheritance": {
 ".tag": "inherit"
 },
 "folder_id": "id:kJU6-a-pT48AAAAAAAABXw"
}

```
