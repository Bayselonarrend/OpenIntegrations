---
sidebar_position: 4
---

# Send external file
 Sends an external file to a list of channels


<br/>


`Function SendExternalFile(Val Token, Val FileID, Val ChannelArray) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | FileID | --fileid | String | File identifier |
 | ChannelArray | --channels | Array Of String | Array of channels for sending |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 Channel = "C070VPMKN8J";
 FileID = "F070P52CU94";
 
 Response = OPI_Slack.SendExternalFile(Token, FileID, Channel); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint slack SendExternalFile --token %token% --fileid "F070P52CU94" --channels %channels%

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
 "is_public": true,
 "public_url_shared": false,
 "display_as_bot": false,
 "username": "",
 "url_private": "https://slack.com/api/files.remote.add",
 "media_display_type": "unknown",
 "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070P52CU94/novyj_fajl",
 "comments_count": 0,
 "is_starred": false,
 "shares": {
 "public": {
 "C06UFNUTKUL": [
 {
 "reply_users": [],
 "reply_users_count": 0,
 "reply_count": 0,
 "ts": "1714146553.217059",
 "channel_name": "slack-api-librarry",
 "team_id": "T06UD92BS3C",
 "share_user_id": "U06UG1CAYH2",
 "source": "UNKNOWN"
 }
 ]
 }
 },
 "channels": [
 "C06UFNUTKUL"
 ],
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
