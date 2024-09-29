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
    Token    = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Calendar = "47826632f9a0502adba79d3cbf90c5d4040622779e07bb8ed56964a2e4f8492a@group.calendar.google.com";
    Event    = "0eaontjjhmu1han6m7i1a51d30";

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar GetEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"

```
