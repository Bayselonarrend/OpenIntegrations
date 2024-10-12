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
    Token    = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
    Calendar = "6fc8b0f11deef05d38eb5d351ab183db9cef1ba870b46367836fc9dc9b9eb4a4@group.calendar.google.com";
    Event    = "941qv5ck599c83mplir8b0gqv0";

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"
null
```
