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
    Token    = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Calendar = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);
```
 



```json title="Result"
null
```
