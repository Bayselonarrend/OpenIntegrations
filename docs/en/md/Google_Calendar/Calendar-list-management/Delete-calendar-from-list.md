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
    Token    = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Calendar = "cf73bcfa8a16eff552d6aa79a9610fdb38ec4db055ab1a0e3b93e32f8414f77c@group.calendar.google.com";

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar DeleteCalendarFromList --token %token% --calendar %calendar%

```

```json title="Result"
null
```
