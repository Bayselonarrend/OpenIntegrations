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
    Token          = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Calendar       = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token
        , Calendar
        , PrimaryColor
        , SecondaryColor
        , Hidden);
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
