---
sidebar_position: 3
---

# Edit calendar
 Edits properties of an existing calendar


*Function EditCalendarMetadata(Val Token, Val Calendar, Val Name = "", Val Description = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |
 | Name | --title | String | New name |
 | Description | --description | String | New calendar description |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Name = "TestCalendar (change.)";
 Description = "TestDescription";
 Response = OPI_GoogleCalendar.EditCalendarMetadata(Token, "55868c32be16935f0...", Name, Description); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
	
```

```sh title="CLI command example"
 
 oint gcalendar EditCalendarMetadata --token %token% --calendar %calendar% --title "TestCalendar (change.)" --description "TestDescription"

```


```json title="Result"

{
 "conferenceProperties": {
 "allowedConferenceSolutionTypes": [
 "hangoutsMeet"
 ]
 },
 "description": "TestDescription",
 "summary": "TestCalendar (change.)",
 "timeZone": "UTC",
 "id": "75b64bec8700a640b004af3491867ac5e479884794f529699da23e7009f7d691@group.calendar.google.com",
 "etag": "\"x8eLqpmgoxpEDEXmEbsZxxgmJhc\"",
 "kind": "calendar#calendar"
 }

```
