---
sidebar_position: 3
---

# Create channel
 Creates a new channel


<br/>


`Function CreateChannel(Val Token, Val Name, Val Private = False) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Name | --title | String | Channel name |
 | Private | --private | Boolean | Create channel as private |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack





```bsl title="Code example"
 
 Name = "testcov" + String(New UUID);
 
 Response = OPI_Slack.CreateChannel(Token, Name, False); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint slack CreateChannel --token %token% --title %title% --private %private%

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
 "updated": 1714146542419,
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
