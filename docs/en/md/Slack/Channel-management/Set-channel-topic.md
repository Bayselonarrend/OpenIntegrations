---
sidebar_position: 11
---

# Set channel topic
 Sets the channel topic


*Function SetChannelTopic(Val Token, Val Channel, Val Topic) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel ID |
 | Topic | --theme | String | Channel topic |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 Channel = "C070VPMKN8J";
 Topic = "TestTopic";
 
 Response = OPI_Slack.SetChannelTopic(Token, Channel, Topic); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint slack SetChannelTopic --token %token% --channel "C070VPMKN8J" --theme "TestTopic"


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
 "updated": 1714146542817,
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
 "last_set": 1714146542
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
