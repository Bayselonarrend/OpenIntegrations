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
    Token    = "ya29.a0AcM612yQIsgMPiOdOLBSBoiVfcCBuJ5T9HRP5lB04ipL2jQDnyuXGmn-IkxMKqss53fPz99sXRoX3_ZJt6s_N7YSfVzI88y_uUa2euM32...";
    Calendar = "cf73bcfa8a16eff552d6aa79a9610fdb38ec4db055ab1a0e3b93e32f8414f77c@group.calendar.google.com";

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
