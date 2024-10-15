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
    Token    = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Calendar = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";
    Event    = "uj01qgmbrm63u98r09qhvaflm8";

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);
```
 



```json title="Result"
null
```
