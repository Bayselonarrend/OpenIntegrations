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
    Token    = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Calendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Event    = "h51qr9dclbnie1hh633er26umo";

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"
""
```
