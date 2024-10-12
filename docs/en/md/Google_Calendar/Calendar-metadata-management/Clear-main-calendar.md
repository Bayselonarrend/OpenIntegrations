---
sidebar_position: 4
---

# Clear primary calendar
 Clears the event list of the primary calendar



`Function ClearMainCalendar(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);
```



```sh title="CLI command example"
    
  oint gcalendar ClearMainCalendar --token %token%

```

```json title="Result"
null
```
