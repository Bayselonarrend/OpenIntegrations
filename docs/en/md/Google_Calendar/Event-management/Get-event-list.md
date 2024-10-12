---
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
    Token    = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Calendar = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetEventList --token %token% --calendar %calendar%

```

```json title="Result"
[
 {
  "kind": "calendar#event",
  "etag": "\"3456908687360000\"",
  "id": "7rfbn0fb8nai4i7v4l435tgl1c",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=N3JmYm4wZmI4bmFpNGk3djRsNDM1dGdsMWMgNjA2MTNkNTNjNDY3MGFiZGNlZWMzZTc2OTNjYTQ3NWIwZTg4ZGMxNjc4ZGI3MjEwNTIxMzU2YjQ5NDBhNjE0OEBn",
  "created": "2024-10-09T06:12:19Z",
  "updated": "2024-10-09T06:12:23.68Z",
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
]
```
