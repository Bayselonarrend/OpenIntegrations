﻿---
sidebar_position: 2
---

# Get list of events
 Gets the list of all calendar events



`Function GetEventList(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - Array of event maps

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Calendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetEventList --token %token% --calendar %calendar%

```

```json title="Result"
[
  {
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  },
  {
  "iconLink": "",
  "title": "",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-20T05:31:12+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-20T06:31:12+03:00"
  },
  "iCalUID": "o6dt8kbedrmu15o53pgbrrv35o@google.com",
  "description": "TestEventDescription",
  "updated": "2024-02-20T11:31:13.044Z",
  "created": "2024-02-20T11:31:13.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=bzZkdDhrYmVkcm11MTVvNTNwZ2JycnYzNW8gYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "On office",
  "summary": "New event",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "o6dt8kbedrmu15o53pgbrrv35o",
  "etag": "\"3416857346088000\"",
  "kind": "calendar#event"
  },
  ]
```
