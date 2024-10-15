---
sidebar_position: 4
---

# Send external file
 Sends an external file to a list of channels



`Function SendExternalFile(Val Token, Val FileID, Val ChannelArray) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | FileID | --fileid | String | File identifier |
  | ChannelArray | --channels | Array Of String | Array of channels for sending |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C06UFNUTKUL";
    FileID  = "F07RF36SEAX";

    Result = OPI_Slack.SendExternalFile(Token, FileID, Channel);
```
 



```json title="Result"
{
 "ok": true,
 "file": {
  "id": "F07QYP172FP",
  "created": 1728454531,
  "timestamp": 1728454531,
  "name": "NewFile",
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
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QYP172FP/newfile",
  "comments_count": 0,
  "is_starred": false,
  "shares": {
   "public": {
    "C06UFNUTKUL": [
     {
      "reply_users": [],
      "reply_users_count": 0,
      "reply_count": 0,
      "ts": "1728454531.918939",
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
  "external_id": "3a61913c-c2ce-412b-a4b4-6875373db31a",
  "external_url": "https://slack.com/api/files.remote.add",
  "has_rich_preview": false,
  "file_access": "visible"
 }
}
```
