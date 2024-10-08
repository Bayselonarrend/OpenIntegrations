﻿---
sidebar_position: 13
---

# Rename channel
 Changes the name of the channel



`Function RenameChannel(Val Token, Val Channel, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Name | --title | String | New channel name |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PK52ES3U";
    Name    = "testconv" + String(New UUID);

    Result = OPI_Slack.RenameChannel(Token, Channel, Name);
```



```sh title="CLI command example"
    
  oint slack RenameChannel --token %token% --channel "C070VPMKN8J" --title %title%

```

```json title="Result"
{
 "ok": true,
 "channel": {
  "id": "C07R448PZJ8",
  "name": "testconvb42c1906-4136-4c7e-ae81-ba7ea2d8c02b",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728454513,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconvb42c1906-4136-4c7e-ae81-ba7ea2d8c02b",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728454516450,
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
  "previous_names": [
   "testconv2383f9a9-fc9f-4928-ba19-511c3b7e9c66"
  ]
 }
}
```
