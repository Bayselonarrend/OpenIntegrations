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
    Token    = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Calendar = "348d646d44d8e791661edfec6bce5af62e9022716033332bf3e3f18fea26a59e@group.calendar.google.com";

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteCalendarFromList --token %token% --calendar %calendar%

```

```json title="Result"
null
```
