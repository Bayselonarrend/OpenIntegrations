---
sidebar_position: 12
---

# Set channel purpose
 Sets the channel purpose (description)



`Function SetChannelGoal(Val Token, Val Channel, Val Purpose) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Channel | --channel | String | Channel ID |
  | Purpose | --purpose | String | Channel purpose |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token   = "xoxb-6965308400114-696804637...";
    Channel = "C07PK52ES3U";
    Purpose = "TestGoal";

    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);
```



```sh title="CLI command example"
    
  oint slack SetChannelGoal --token %token% --channel "C070VPMKN8J" --purpose "TestGoal"

```

```json title="Result"
{
 "ok": true,
 "channel": {
  "id": "C07QMBL2E8L",
  "name": "testconv52e49985-f55c-4f12-8bd2-0d8d571ccd3a",
  "is_channel": true,
  "is_group": false,
  "is_im": false,
  "is_mpim": false,
  "is_private": false,
  "created": 1728140453,
  "is_archived": false,
  "is_general": false,
  "unlinked": 0,
  "name_normalized": "testconv52e49985-f55c-4f12-8bd2-0d8d571ccd3a",
  "is_shared": false,
  "is_org_shared": false,
  "is_pending_ext_shared": false,
  "pending_shared": [],
  "context_team_id": "T06UD92BS3C",
  "updated": 1728140454459,
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
   "last_set": 1728140454
  },
  "purpose": {
   "value": "TestGoal",
   "creator": "U06UG1CAYH2",
   "last_set": 1728140454
  },
  "previous_names": []
 }
}
```
