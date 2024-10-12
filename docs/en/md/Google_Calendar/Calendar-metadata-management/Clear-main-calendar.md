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
    Token = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);
```



```sh title="CLI command example"
    
  oint gcalendar ClearMainCalendar --token %token%

```

```json title="Result"
null
```
