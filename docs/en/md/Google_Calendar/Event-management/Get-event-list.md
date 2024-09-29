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
  "etag": "\"3455260709062000\"",
  "id": "nkeonu0b5b3flradhop3ist4vk",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=bmtlb251MGI1YjNmbHJhZGhvcDNpc3Q0dmsgYjA0MjAwMGYwYTRjYzU5ZTk2OWRkOTljZWMzNjk2ZmYwZDI2OWFhZTNkMWRhZjdmMjQ1N2RmMjg4ZmUzMzgzNUBn",
  "created": "2024-09-29T17:19:10Z",
  "updated": "2024-09-29T17:19:14.531Z",
  "summary": "New event",
  "description": "New event description",
  "location": "InOffice",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "b042000f0a4cc59e969dd99cec3696ff0d269aae3d1daf7f2457df288fe33835@group.calendar.google.com",
   "displayName": "TestCalendar",
   "self": true
  },
  "start": {
   "dateTime": "2024-09-29T23:19:10+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-09-30T00:19:10+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "nkeonu0b5b3flradhop3ist4vk@google.com",
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
