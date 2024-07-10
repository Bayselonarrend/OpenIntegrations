---
sidebar_position: 4
---

# Create event
 Creates a new event


<br/>


`Function CreateEvent(Val Token, Val Calendar, Val EventDescription) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |
 | EventDescription | --props | Map Of KeyAndValue | Event description |

 
 Returns: String, Arbitrary, HTTPResponse, BinaryData, Undefined - Google server response

<br/>




```bsl title="Code example"
 
 Attachments = New Map;
 Attachments.Insert("Image1", "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png");
 Attachments.Insert("Image2", "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1");
 
 EventMap = New Map;
 EventMap.Insert("Description", Description);
 EventMap.Insert("Title", Name);
 EventMap.Insert("Venue", "On office");
 EventMap.Insert("StartDate", CurrentSessionDate());
 EventMap.Insert("EndDate", EventMap["StartDate"] + 3600);
 EventMap.Insert("ArrayOfAttachmentURLs", Attachments);
 EventMap.Insert("SendNotifications", True);
 
 Response = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventMap);
 Response = OPI_Tools.JSONString(Response);
```
	


```sh title="CLI command example"
 
 oint gcalendar CreateEvent --token %token% --calendar %calendar% --props %props%

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
