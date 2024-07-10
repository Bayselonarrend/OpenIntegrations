---
sidebar_position: 2
---

# Add calendar to list
 Adds an existing calendar to the user's list


<br/>


`Function AddCalendarToList(Val Token, Val Calendar) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google





```bsl title="Code example"
 
 Response = OPI_GoogleCalendar.AddCalendarToList(Token, "55868c32be16935f0..."); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint gcalendar AddCalendarToList --token %token% --calendar %calendar%

```

```json title="Result"
 {
 "conferenceProperties": {
 "allowedConferenceSolutionTypes": [
 "hangoutsMeet"
 ]
 },
 "accessRole": "owner",
 "selected": true,
 "foregroundColor": "#000000",
 "backgroundColor": "#7bd148",
 "colorId": "9",
 "description": "TestDescription",
 "summary": "TestCalendar (change.)",
 "defaultReminders": [],
 "timeZone": "UTC",
 "id": "f0fad8c7db43ef0adb71cbf035eb08cf80d8f8d51ba31fa86f4d5680dc2e9725@group.calendar.google.com",
 "etag": "\"1708423365033000\"",
 "kind": "calendar#calendarListEntry"
 }
```
