---
sidebar_position: 3
---

# Get event
 Gets an event by ID



`Function GetEvent(Val Token, Val Calendar, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | Event | --event | String | Event ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Calendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Event    = "h51qr9dclbnie1hh633er26umo";

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar GetEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"

```
