---
sidebar_position: 3
---

# Get file data
 Gets information about the file


<br/>


`Function GetFileData(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | FileID | --fileid | String | File identifier |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 FileID = "F070VL6FQFM";
 
 Response = OPI_Slack.GetFileData(Token, FileID); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint slack GetFileData --token %token% --fileid "F070VL6FQFM"

```

```json title="Result"
{
 "ok": true,
 "file": {
 "id": "F070VL6FQFM",
 "created": 1714146550,
 "timestamp": 1714146550,
 "name": "megadoc.docx",
 "title": "NewFile",
 "mimetype": "",
 "filetype": "",
 "pretty_type": "",
 "user": "U06UG1CAYH2",
 "user_team": "T06UD92BS3C",
 "editable": false,
 "size": 24069,
 "mode": "hosted",
 "is_external": false,
 "external_type": "",
 "is_public": false,
 "public_url_shared": false,
 "display_as_bot": false,
 "username": "",
 "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070VL6FQFM/megadoc.docx",
 "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070VL6FQFM/download/megadoc.docx",
 "media_display_type": "unknown",
 "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070VL6FQFM/megadoc.docx",
 "permalink_public": "https://slack-files.com/T06UD92BS3C-F070VL6FQFM-9fb2618d36",
 "is_starred": false,
 "shares": {},
 "channels": [],
 "groups": [],
 "ims": [],
 "has_more_shares": false,
 "has_rich_preview": false,
 "file_access": "visible",
 "comments_count": 0
 },
 "comments": [],
 "response_metadata": {
 "next_cursor": ""
 }
 }
```
