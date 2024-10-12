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
    Token          = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Calendar       = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token
        , Calendar
        , PrimaryColor
        , SecondaryColor
        , Hidden);
```



```sh title="CLI command example"
    
  oint gcalendar EditListCalendar --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Result"
{
 "kind": "calendar#calendarListEntry",
 "etag": "\"1728454322717000\"",
 "id": "48ff105e488eea0a588031479250116f2e769f150c2ca1274b7e79c4b057b46b@group.calendar.google.com",
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
