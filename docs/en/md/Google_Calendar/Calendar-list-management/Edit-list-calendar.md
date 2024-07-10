---
sidebar_position: 5
---

# Edit list calendar
 Edits the properties of a calendar from the user's list




<br/>


*Function EditListCalendar(Val Token, Val Calendar, Val PrimaryColor, Val SecondaryColor, Val Hidden = False) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |
 | PrimaryColor | --primary | String | HEX primary color (#ffffff) |
 | SecondaryColor | --secondary | String | HEX secondary color (#ffffff) |
 | Hidden | --hidden | Boolean | Hidden calendar |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google


```bsl title="Code example"
 
 
 Black = "#000000";
 Yellow = "#ffd800";
 
 Response = OPI_GoogleCalendar.EditListCalendar(Token, "55868c32be16935f0...", Black, Yellow, False); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint gcalendar EditListCalendar --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Result"
 {
 "conferenceProperties": {
 "allowedConferenceSolutionTypes": [
 "hangoutsMeet"
 ]
 },
 "accessRole": "owner",
 "foregroundColor": "#000000",
 "backgroundColor": "#ffd800",
 "colorId": "6",
 "description": "TestDescription",
 "summary": "TestCalendar (change.)",
 "defaultReminders": [],
 "timeZone": "UTC",
 "id": "0da65d69eba1e4b27f980447827b251ca2d94ecb1d30dba22c83559c33d0ea29@group.calendar.google.com",
 "etag": "\"1708424005038000\"",
 "kind": "calendar#calendarListEntry"
 }
```
