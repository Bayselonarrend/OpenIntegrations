---
sidebar_position: 3
---

# Get event
 Gets an event by ID



`Function GetEvent(Val Token, Val Calendar, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | Event | --event | String | Event ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Calendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Event    = "h51qr9dclbnie1hh633er26umo";

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar GetEvent --token %token% --calendar %calendar% --event %event%

```

```json title="Result"
{
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "Image2",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  },
  {
  "iconLink": "",
  "title": "Image1",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-21T15:16:25+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-21T16:16:25+03:00"
  },
  "iCalUID": "j4nonfcc0m2mtop1vc8ivo8tb8@google.com",
  "description": "TestEventDescription",
  "updated": "2024-02-21T09:16:28.474Z",
  "created": "2024-02-21T09:16:28.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=ajRub25mY2MwbTJtdG9wMXZjOGl2bzh0YjggYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "On office",
  "summary": "New event",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "j4nonfcc0m2mtop1vc8ivo8tb8",
  "etag": "\"3417013976948000\"",
  "kind": "calendar#event"
  }
```
