---
sidebar_position: 3
---

# Edit calendar
 Edits properties of an existing calendar



`Function EditCalendarMetadata(Val Token, Val Calendar, Val Name = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | Name | --title | String | New name |
  | Description | --description | String | New calendar description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Calendar    = "47826632f9a0502adba79d3cbf90c5d4040622779e07bb8ed56964a2e4f8492a@group.calendar.google.com";
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);
```



```sh title="CLI command example"
    
  oint gcalendar EditCalendarMetadata --token %token% --calendar %calendar% --title "TestCalendar (change.)" --description "TestDescription"

```

```json title="Result"

```
