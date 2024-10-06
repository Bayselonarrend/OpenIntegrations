---
sidebar_position: 3
---

# Create channel
 Creates a new channel



`Function CreateChannel(Val Token, Val Name, Val Private = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | Name | --title | String | Channel name |
  | Private | --private | Boolean | Create channel as private |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token = "xoxb-6965308400114-696804637...";
    Name  = "testconv" + String(New UUID);

    Result = OPI_Slack.CreateChannel(Token, Name);
```



```sh title="CLI command example"
    
  oint slack CreateChannel --token %token% --title %title% --private %private%

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
  "updated": 1728140453698,
  "parent_conversation": null,
  "creator": "U06UG1CAYH2",
  "is_ext_shared": false,
  "shared_team_ids": [
   "T06UD92BS3C"
  ],
  "pending_connected_team_ids": [],
  "is_member": true,
  "last_read": "0000000000.000000",
  "topic": {
   "value": "",
   "creator": "",
   "last_set": 0
  },
  "purpose": {
   "value": "",
   "creator": "",
   "last_set": 0
  },
  "previous_names": [],
  "priority": 0
 }
}
```
