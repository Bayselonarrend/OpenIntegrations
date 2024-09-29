---
sidebar_position: 7
---

# Delete event
 Deletes an event by ID



`Function DeleteEvent(Val Token, Val Calendar, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | Event | --event | String | Event ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Event    = "ro3gv4dokajnh90pcn58lel8e4";

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"

```
