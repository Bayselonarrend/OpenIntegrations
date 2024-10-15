---
sidebar_position: 3
---

# Get file data
 Gets information about the file



`Function GetFileData(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07RFKJR7GW";

    Result = OPI_Slack.GetFileData(Token, FileID);
```
 



```json title="Result"
{
 "ok": true,
 "file": {
  "id": "F07QV0PCS1L",
  "created": 1728454525,
  "timestamp": 1728454525,
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
  "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F07QV0PCS1L/megadoc.docx",
  "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F07QV0PCS1L/download/megadoc.docx",
  "media_display_type": "unknown",
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QV0PCS1L/megadoc.docx",
  "permalink_public": "https://slack-files.com/T06UD92BS3C-F07QV0PCS1L-dec85076a5",
  "favorites": [],
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
