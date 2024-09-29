---
sidebar_position: 2
---

# Add calendar to list
 Adds an existing calendar to the user's list



`Function AddCalendarToList(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Calendar = "47826632f9a0502adba79d3cbf90c5d4040622779e07bb8ed56964a2e4f8492a@group.calendar.google.com";

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar AddCalendarToList --token %token% --calendar %calendar%

```

```json title="Result"

```
