---
sidebar_position: 3
---

# Get event
 Gets an event by ID


*Function GetEvent(Val Token, Val Calendar, Val Event) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |
 | Event | --event | String | Event ID |

 
 Returns: Key-Value Pair - serialized JSON response from Google

```bsl title="Code example"
	
 
 Response = OPI_GoogleCalendar.GetEvent(Token, "55868c32be16935f0...", "j4nonfcc0m2..."); //Map
 Response = OPI_Tools.JSONString(Response); //String
 

	
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
