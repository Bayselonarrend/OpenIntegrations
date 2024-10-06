---
sidebar_position: 5
---

# Edit list calendar
 Edits the properties of a calendar from the user's list



`Function EditListCalendar(Val Token, Val Calendar, Val PrimaryColor, Val SecondaryColor, Val Hidden = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | PrimaryColor | --primary | String | HEX primary color (#ffffff) |
  | SecondaryColor | --secondary | String | HEX secondary color (#ffffff) |
  | Hidden | --hidden | Boolean | Hidden calendar |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token          = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar       = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, PrimaryColor, SecondaryColor, False);
```



```sh title="CLI command example"
    
  oint gcalendar EditListCalendar --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Result"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728140261497000\"",
 "id": "595e045ef60a36f287b2dc1af89e0685697bab5f36281d7177f4d2d10267a539@group.calendar.google.com",
 "summary": "New name",
 "description": "New description",
 "timeZone": "Europe/Moscow",
 "colorId": "6",
 "backgroundColor": "#ffd800",
 "foregroundColor": "#000000",
 "accessRole": "owner",
 "defaultReminders": [],
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
