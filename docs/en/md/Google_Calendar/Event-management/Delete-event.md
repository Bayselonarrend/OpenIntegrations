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
    Token    = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Calendar = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";
    Event    = "8k946a5apd6kblura1vnpjp5ts";

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"
null
```
