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
  "etag": "\"3456280564862000\"",
  "id": "b07ij9l6bkkuolmeabdb8gi868",
  "status": "confirmed",
  "htmlLink": "https://www.google.com/calendar/event?eid=YjA3aWo5bDZia2t1b2xtZWFiZGI4Z2k4NjggYjEyMmY1ODQzZDYzZjUzMzQ2MWNhN2M5ZjEzNmEwMTMwNDYxNDc4Y2NhZmU0NzViNzdlMGI1N2U4ZjM1YjljZUBn",
  "created": "2024-10-05T14:57:58Z",
  "updated": "2024-10-05T14:58:02.431Z",
  "summary": "New event",
  "description": "New event description",
  "location": "InOffice",
  "creator": {
   "email": "bayselonarrend@gmail.com"
  },
  "organizer": {
   "email": "b122f5843d63f533461ca7c9f136a0130461478ccafe475b77e0b57e8f35b9ce@group.calendar.google.com",
   "displayName": "TestCalendar",
   "self": true
  },
  "start": {
   "dateTime": "2024-10-05T20:57:58+03:00",
   "timeZone": "Europe/Moscow"
  },
  "end": {
   "dateTime": "2024-10-05T21:57:58+03:00",
   "timeZone": "Europe/Moscow"
  },
  "iCalUID": "b07ij9l6bkkuolmeabdb8gi868@google.com",
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
