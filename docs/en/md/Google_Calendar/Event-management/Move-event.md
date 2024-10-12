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
    Token = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Event = "gacdd2rkrjnue8j1387ace13fc";

    SourceCalendar = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";
    TargetCalendar = "bayselonarrend@gmail.com";

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar MoveEvent --token %token% --from %from% --to %to% --event %event%

```

```json title="Result"
{
 "kind": "calendar#event",
 "etag": "\"3456908680754000\"",
 "id": "7rfbn0fb8nai4i7v4l435tgl1c",
 "status": "cancelled",
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
  "email": "bayselonarrend@gmail.com"
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
