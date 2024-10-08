---
sidebar_position: 11
---

# Set channel topic
 Sets the channel topic



`Function SetChannelTopic(Val Token, Val Channel, Val Topic) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Topic | --theme | String | Channel topic |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PK52ES3U";
    Topic   = "TestTopic";

    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);
```



```sh title="CLI command example"
    
  oint slack SetChannelTopic --token %token% --channel "C070VPMKN8J" --theme "TestTopic"

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
  "updated": 1728328834889,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": false,
  "topic": {
   "value": "TestTopic",
   "creator": "U06UG1CAYH2",
   "last_set": 1728328834
  },
  "purpose": {
   "value": "",
   "creator": "",
   "last_set": 0
  },
  "previous_names": []
 }
}
```
