---
sidebar_position: 1
---

# Create calendar
 Creates an empty calendar


*Function CreateCalendar(Val Token, Val Name) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Name | --title | String | Name of the created calendar |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Response = OPI_GoogleCalendar.CreateCalendar(Token, "TestCalendar"); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
	
```

```sh title="CLI command example"
 
 oint gcalendar CreateCalendar --token %token% --title %title%


```


```json title="Result"

{
 "conferenceProperties": {
 "allowedConferenceSolutionTypes": [
 "hangoutsMeet"
 ]
 },
 "summary": "TestCalendar",
 "timeZone": "UTC",
 "id": "75b64bec8700a640b004af3491867ac5e479884794f529699da23e7009f7d691@group.calendar.google.com",
 "etag": "\"ZlOrbHnYjwJB0APkTQupgFm7F3s\"",
 "kind": "calendar#calendar"
 }

```
