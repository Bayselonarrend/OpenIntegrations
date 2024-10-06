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
    Token    = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar AddCalendarToList --token %token% --calendar %calendar%

```

```json title="Result"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728140261251000\"",
 "id": "595e045ef60a36f287b2dc1af89e0685697bab5f36281d7177f4d2d10267a539@group.calendar.google.com",
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
