﻿---
sidebar_position: 9
---

# Join channel
 Adds the current bot to the channel



`Function JoinChannel(Val Token, Val Channel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PK52ES3U";

    Result = OPI_Slack.JoinChannel(Token, Channel);
```



```sh title="CLI command example"
    
  oint slack JoinChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
 "ok": true,
 "channel": {
  "id": "C07R448PZJ8",
  "name": "testconv2383f9a9-fc9f-4928-ba19-511c3b7e9c66",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728454513,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv2383f9a9-fc9f-4928-ba19-511c3b7e9c66",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728454514526,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "1728454514.991459",
  "topic": {
   "value": "TestTopic",
   "creator": "U06UG1CAYH2",
   "last_set": 1728454514
  },
  "purpose": {
   "value": "TestGoal",
   "creator": "U06UG1CAYH2",
   "last_set": 1728454514
  },
  "previous_names": [],
  "priority": 0
 }
}
```
