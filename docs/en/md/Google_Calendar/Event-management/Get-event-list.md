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
    Token    = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetEventList --token %token% --calendar %calendar%

```

```json title="Result"
[
 {
  "kind": "calendar#event",
  "etag": "\"3456657316246000\"",
  "id": "2m8dvff37scrs418csuqd9c0l0",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=Mm04ZHZmZjM3c2NyczQxOGNzdXFkOWMwbDAgYjA5MTYxMDAyM2EyOWM0NzY5ZGI3NjUyZmNiN2E1YTMyNTRmNGQ2NjdiZWJkNTBmOTZmMGY0NWY2NTE3NzIzYkBn",
  "created": "2024-10-07T19:17:34Z",
  "updated": "2024-10-07T19:17:38.123Z",
  "summary": "New event",
  "description": "New event description",
  "location": "InOffice",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "b091610023a29c4769db7652fcb7a5a3254f4d667bebd50f96f0f45f6517723b@group.calendar.google.com",
   "displayName": "TestCalendar",
   "self": true
  },
  "start": {
   "dateTime": "2024-10-08T01:17:34+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-10-08T02:17:34+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "2m8dvff37scrs418csuqd9c0l0@google.com",
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
