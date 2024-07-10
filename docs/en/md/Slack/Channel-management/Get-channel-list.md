---
sidebar_position: 1
---

# Get channel list
 Gets a list of available channels



`Function GetChannelList(Val Token, Val ExcludeArchived = False, Val Cursor = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ExcludeArchived | --notarchived | Boolean | Indicator of excluding archived channels |
 | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 ExcludeArchived = True;
 
 Response = OPI_Slack.GetChannelList(Token, ExcludeArchived); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
```
	


```sh title="CLI command example"
 
 oint slack GetChannelList --token %token% --notarchived "True" --cursor %cursor%

```

```json title="Result"
{
 "ok": true,
 "channels": [
 {
 "id": "C06UD92DF1Q",
 "name": "general",
 "is_channel": true,
 "is_group": false,
 "is_im": false,
 "is_mpim": false,
 "is_private": false,
 "created": 1713202497,
 "is_archived": false,
 "is_general": true,
 "unlinked": 0,
 "name_normalized": "general",
 "is_shared": false,
 "is_org_shared": false,
 "is_pending_ext_shared": false,
 "pending_shared": [],
 "context_team_id": "T06UD92BS3C",
 "updated": 1713202497794,
 "parent_conversation": null,
 "creator": "U06UABH3APP",
 "is_ext_shared": false,
 "shared_team_ids": [
 "T06UD92BS3C"
 ],
 "pending_connected_team_ids": [],
 "is_member": false,
 "topic": {
 "value": "",
 "creator": "",
 "last_set": 0
 },
 "purpose": {
 "value": "This is the one channel that will always include everyone. It’s a great spot for announcements and team-wide conversations.",
 "creator": "U06UABH3APP",
 "last_set": 1713202497
 },
 "properties": {
 "use_case": "welcome"
 },
 "previous_names": [],
 "num_members": 1
 }
 ]
 }
```
