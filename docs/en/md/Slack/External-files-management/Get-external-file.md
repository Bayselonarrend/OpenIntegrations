---
sidebar_position: 2
---

# Get external file
 Gets information about the external file


<br/>


`Function GetExternalFile(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | FileID | --fileid | String | File identifier |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack





```bsl title="Code example"
 
 FileID = "F070P52CU94";
 
 Response = OPI_Slack.GetExternalFile(Token, FileID); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint slack GetExternalFile --token %token% --fileid "F070P52CU94"

```

```json title="Result"
 {
 "ok": true,
 "file": {
 "id": "F070P52CU94",
 "created": 1714146552,
 "timestamp": 1714146552,
 "name": "Novyj_fajl",
 "title": "NewFile",
 "mimetype": "application/vnd.slack-remote",
 "filetype": "remote",
 "pretty_type": "Remote",
 "user": "U06UG1CAYH2",
 "user_team": "T06UD92BS3C",
 "editable": false,
 "size": 0,
 "mode": "external",
 "is_external": true,
 "external_type": "app",
 "is_public": false,
 "public_url_shared": false,
 "display_as_bot": false,
 "username": "",
 "url_private": "https://slack.com/api/files.remote.add",
 "media_display_type": "unknown",
 "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070P52CU94/novyj_fajl",
 "comments_count": 0,
 "is_starred": false,
 "shares": {},
 "channels": [],
 "groups": [],
 "ims": [],
 "has_more_shares": false,
 "external_id": "d2a110a2-08eb-4f20-989f-8943f0816420",
 "external_url": "https://slack.com/api/files.remote.add",
 "has_rich_preview": false,
 "file_access": "visible"
 }
 }
```
