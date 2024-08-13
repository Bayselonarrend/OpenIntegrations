---
sidebar_position: 2
---

# Get events
 Receives bot events in Polling mode



`Function GetEvents(Val Token, Val LastID, Val Timeout = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | LastID | --last | String, Number | ID of the last event processed before this event |
  | Timeout | --timeout | String, Number | Connection hold time for Long Polling |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /events/get](https://teams.vk.com/botapi/#/events/get_events_get)
:::
<br/>


```bsl title="Code example"
  Token  = "001.3501506236.091...";
  LastID = 0;
  
  For N = 1 To 5 Do // In real work - endless loop
  
  Result = OPI_VKTeams.GetEvents(Token, LastID, 3);
  
  Events = Result["events"];
  
  // Event handling...
  
  If Not Events.Count() = 0 Then
  LastID            = Events[Events.UBound()]["eventId"];
  EndIf;
  
  EndDo;
```



```sh title="CLI command example"
    
  oint vkteams GetEvents --token "001.3501506236.091..." --last "Events[Events.UBound()][eventId]" --timeout %timeout%

```

```json title="Result"

```
