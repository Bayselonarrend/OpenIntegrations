---
sidebar_position: 5
---

# Move event
 Moves an event to another calendar



`Function MoveEvent(Val Token, Val SourceCalendar, Val TargetCalendar, Val Event) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | SourceCalendar | --from | String | ID of the source calendar |
  | TargetCalendar | --to | String | ID of the target calendar |
  | Event | --event | String | ID of the source calendar event |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";
    Event = "h51qr9dclbnie1hh633er26umo";

    SourceCalendar = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    TargetCalendar = "bayselonarrend@gmail.com";

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar MoveEvent --token %token% --from %from% --to %to% --event %event%

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
  "dateTime": "2024-02-24T16:20:49+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-24T17:20:49+03:00"
  },
  "iCalUID": "f9kkj2omsqtt67g12qh2jig8uk@google.com",
  "description": "TestEventDescription",
  "updated": "2024-02-24T10:20:51.234Z",
  "created": "2024-02-24T10:20:49.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=Zjlra2oyb21zcXR0NjdnMTJxaDJqaWc4dWsgYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "InOffice",
  "summary": "New event",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "f9kkj2omsqtt67g12qh2jig8uk",
  "etag": "\"3417540102468000\"",
  "kind": "calendar#event"
  }
```
