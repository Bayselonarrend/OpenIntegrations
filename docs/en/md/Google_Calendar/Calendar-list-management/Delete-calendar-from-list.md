---
sidebar_position: 4
---

# Remove calendar from list
 Removes a calendar from the user's list



`Function DeleteCalendarFromList(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Calendar = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteCalendarFromList --token %token% --calendar %calendar%

```

```json title="Result"
null
```
