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
    Token = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Event = "ro3gv4dokajnh90pcn58lel8e4";

    SourceCalendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    TargetCalendar = "bayselonarrend@gmail.com";

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);
```



```sh title="CLI command example"
    
  oint gcalendar MoveEvent --token %token% --from %from% --to %to% --event %event%

```

```json title="Result"
{
 "kind": "calendar#event",
 "etag": "\"3456657309578000\"",
 "id": "2m8dvff37scrs418csuqd9c0l0",
 "status": "cancelled",
 "htmlLink": "https://www.google.com/calendar/event?eid=Mm04ZHZmZjM3c2NyczQxOGNzdXFkOWMwbDAgYjA5MTYxMDAyM2EyOWM0NzY5ZGI3NjUyZmNiN2E1YTMyNTRmNGQ2NjdiZWJkNTBmOTZmMGY0NWY2NTE3NzIzYkBn",
 "created": "2024-10-07T19:17:34Z",
 "updated": "2024-10-07T19:17:34.789Z",
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
```
