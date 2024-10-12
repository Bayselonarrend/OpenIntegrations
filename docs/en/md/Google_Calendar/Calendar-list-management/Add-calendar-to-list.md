---
sidebar_position: 2
---

# Add calendar to list
 Adds an existing calendar to the user's list



`Function AddCalendarToList(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612y5AI1OiRmaNZZdcZkEXR0hzPPvvmrHwVvQ_wKT0Lo35AFd6j6lHZWalv-zxiYHKQUWkU1GRjCf4Lo9uQwygnC9xAOZKaOORjGI3...";
    Calendar = "348d646d44d8e791661edfec6bce5af62e9022716033332bf3e3f18fea26a59e@group.calendar.google.com";

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar AddCalendarToList --token %token% --calendar %calendar%

```

```json title="Result"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728454322437000\"",
 "id": "48ff105e488eea0a588031479250116f2e769f150c2ca1274b7e79c4b057b46b@group.calendar.google.com",
 "summary": "New name",
 "description": "New description",
 "timeZone": "Europe/Moscow",
 "colorId": "4",
 "backgroundColor": "#fa573c",
 "foregroundColor": "#000000",
 "selected": true,
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
