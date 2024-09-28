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
    Token       = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Calendar    = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);
```



```sh title="CLI command example"
    
  oint gcalendar EditCalendarMetadata --token %token% --calendar %calendar% --title "TestCalendar (change.)" --description "TestDescription"

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
  "id": "75b64bec8700a640b004af3491867ac5e479884794f529699da23e7009f7d691@group.calendar.google.com",
  "etag": "\"x8eLqpmgoxpEDEXmEbsZxxgmJhc\"",
  "kind": "calendar#calendar"
  }
```
