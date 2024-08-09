---
sidebar_position: 2
---

# Get events
 Receives bot events in Polling mode



`Function GetEvents(Val Token, Val LastID, Val Timeout = 0) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | LastID | --last | String, Number | ID of the last event processed before this event |
 | Timeout | --timeout | String, Number | Connection hold time for Long Polling |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /events/get](https://teams.vk.com/botapi/#/events/get_events_get)
:::
<br/>


	


```sh title="CLI command example"
 
 oint vkteams GetEvents --token %token% --last %last% --timeout %timeout%

```

```json title="Result"
{
 "events": [],
 "ok": true
}
```
