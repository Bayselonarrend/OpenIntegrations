---
sidebar_position: 5
---

# Move event
 Moves an event to another calendar



`Function MoveEvent(Val Token, Val SourceCalendar, Val TargetCalendar, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | SourceCalendar | --from | String | ID of the source calendar |
  | TargetCalendar | --to | String | ID of the target calendar |
  | Event | --event | String | ID of the source calendar event |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Event = "ro3gv4dokajnh90pcn58lel8e4";

    SourceCalendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    TargetCalendar = "bayselonarrend@gmail.com";

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar MoveEvent --token %token% --from %from% --to %to% --event %event%

```

```json title="Result"

```
