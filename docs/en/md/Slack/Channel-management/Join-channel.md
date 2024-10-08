---
sidebar_position: 9
---

# Join channel
 Adds the current bot to the channel



`Function JoinChannel(Val Token, Val Channel) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

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
  "id": "C07QSFDNSUB",
  "name": "testconvefd91cd9-7a21-4925-ac86-377c72e5f634",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728328834,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconvefd91cd9-7a21-4925-ac86-377c72e5f634",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728328835140,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "1728328835.567789",
  "topic": {
   "value": "TestTopic",
   "creator": "U06UG1CAYH2",
   "last_set": 1728328834
  },
  "purpose": {
   "value": "TestGoal",
   "creator": "U06UG1CAYH2",
   "last_set": 1728328835
  },
  "previous_names": [],
  "priority": 0
 }
}
```
