﻿---
sidebar_position: 5
---

# Get channel
 Gets information about the channel



`Function GetChannel(Val Token, Val Channel) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 Channel = "C070VPMKN8J";
 
 Response = OPI_Slack.GetChannel(Token, Channel); //Map
 Response = OPI_Tools.JSONString(Response);//JSON string
```
	


```sh title="CLI command example"
 
 oint slack GetChannel --token %token% --channel "C070VPMKN8J"

```

```json title="Result"
{
 "ok": true,
 "channel": {
 "id": "C070VPMKN8J",
 "name": "testconv9a14fe4d-2fb1-4e47-b1e4-9bc1e4f7a05c",
 "is_channel": true,
 "is_group": false,
 "is_im": false,
 "is_mpim": false,
 "is_private": false,
 "created": 1714146542,
 "is_archived": false,
 "is_general": false,
 "unlinked": 0,
 "name_normalized": "testconv9a14fe4d-2fb1-4e47-b1e4-9bc1e4f7a05c",
 "is_shared": false,
 "is_org_shared": false,
 "is_pending_ext_shared": false,
 "pending_shared": [],
 "context_team_id": "T06UD92BS3C",
 "updated": 1714146542983,
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
 "value": "TestTopic",
 "creator": "U06UG1CAYH2",
 "last_set": 1714146542
 },
 "purpose": {
 "value": "TestGoal",
 "creator": "U06UG1CAYH2",
 "last_set": 1714146542
 },
 "previous_names": []
 }
 }
```
