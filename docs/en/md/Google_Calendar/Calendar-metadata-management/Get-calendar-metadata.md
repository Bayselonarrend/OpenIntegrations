---
sidebar_position: 2
---

# Get calendar
 Gets calendar information by ID


*Function GetCalendarMetadata(Val Token, Val Calendar) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Response = OPI_GoogleCalendar.GetCalendarMetadata(Token, "55868c32be16935f0..."); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
	
```

```sh title="CLI command example"
 
 oint gcalendar GetCalendarMetadata --token %token% --calendar %calendar%


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
 "id": "155868c32be26e4c4123a107810d40b929b516935f080e4747261fdc3416227c@group.calendar.google.com",
 "etag": "\"4A10_PI6FFY129ggELzZ8veUU-U\"",
 "kind": "calendar#calendar"
 }

```
