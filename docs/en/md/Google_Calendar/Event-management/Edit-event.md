---
sidebar_position: 6
---

# Edit event
 Edits an existing event



`Function EditEvent(Val Token, Val Calendar, Val EventDescription, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | EventDescription | --props | String | New event description |
  | Event | --event | String | Event ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Calendar    = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Event       = "h51qr9dclbnie1hh633er26umo";
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventDescription, Event);
```



```sh title="CLI command example"
    
  oint gcalendar EditEvent --token %token% --calendar %calendar% --props %props% --event %event%

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
  "dateTime": "2024-02-24T16:42:28+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T17:42:28+03:00"
  },
  "iCalUID": "7c2s6g3k6ib1mr2v1b7lnt9kfk@google.com",
  "description": "Test event description (change.)",
  "updated": "2024-02-24T10:42:42.401Z",
  "created": "2024-02-24T10:42:32.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=N2MyczZnM2s2aWIxbXIydjFiN2xudDlrZmsgYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "InOffice",
  "summary": "New event",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "7c2s6g3k6ib1mr2v1b7lnt9kfk",
  "etag": "\"3417542724802000\"",
  "kind": "calendar#event"
  }
```
