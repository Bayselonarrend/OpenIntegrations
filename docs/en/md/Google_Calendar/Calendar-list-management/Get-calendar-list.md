---
sidebar_position: 1
---

# Get list of calendars
 Gets an array of account calendars



`Function GetCalendarList(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - Array of calendar data mappings

<br/>




```bsl title="Code example"
    Token  = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Result = OPI_GoogleCalendar.GetCalendarList(Token);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarList --token %token%

```

```json title="Result"

```
