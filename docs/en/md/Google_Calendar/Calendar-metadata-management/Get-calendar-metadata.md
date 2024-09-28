---
sidebar_position: 2
---

# Get calendar
 Gets calendar information by ID



`Function GetCalendarMetadata(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Calendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarMetadata --token %token% --calendar %calendar%

```

```json title="Result"
{
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "description": "TestDescription",
  "summary": "TestCalendar (change.)",
  "timeZone": "UTC",
  "id": "155868c32be26e4c4123a107810d40b929b516935f080e4747261fdc3416227c@group.calendar.google.com",
  "etag": "\"4A10_PI6FFY129ggELzZ8veUU-U\"",
  "kind": "calendar#calendar"
  }
```
