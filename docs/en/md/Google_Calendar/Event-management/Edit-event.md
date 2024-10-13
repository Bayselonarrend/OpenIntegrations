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
    Token       = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Calendar    = "2cd4d2b5dc7a898d4f1d65956b5ccca32841aff4a1603b373ff14db442ac9fab@group.calendar.google.com";
    Event       = "33cn8ioc097i92k9i37mvpbj50";
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
 "kind": "calendar#event",
 "etag": "\"3456908680754000\"",
 "id": "7rfbn0fb8nai4i7v4l435tgl1c",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=N3JmYm4wZmI4bmFpNGk3djRsNDM1dGdsMWMgNjA2MTNkNTNjNDY3MGFiZGNlZWMzZTc2OTNjYTQ3NWIwZTg4ZGMxNjc4ZGI3MjEwNTIxMzU2YjQ5NDBhNjE0OEBn",
 "created": "2024-10-09T06:12:19Z",
 "updated": "2024-10-09T06:12:20.377Z",
 "summary": "New event",
 "description": "New event description",
 "location": "InOffice",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "60613d53c4670abdceec3e7693ca475b0e88dc1678db7210521356b4940a6148@group.calendar.google.com",
  "displayName": "TestCalendar",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-09T12:12:19+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-09T13:12:19+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "7rfbn0fb8nai4i7v4l435tgl1c@google.com",
 "sequence": 0,
 "reminders": {
  "useDefault": true
 },
 "attachments": [
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
   "title": "Image1",
   "iconLink": ""
  },
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
   "title": "Image2",
   "iconLink": ""
  }
 ],
 "eventType": "default"
}
```
