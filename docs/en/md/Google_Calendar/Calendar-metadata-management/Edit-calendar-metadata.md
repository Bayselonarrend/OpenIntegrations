---
sidebar_position: 3
---

# Edit calendar
 Edits properties of an existing calendar



`Function EditCalendarMetadata(Val Token, Val Calendar, Val Name = "", Val Description = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | Name | --title | String | New name |
  | Description | --description | String | New calendar description |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token       = "ya29.a0AcM612wD1Uh1izWoUeXoBTM33TS6PlaGZFI6xXeGHeWT2_ZZZ0UbpJzbIurRFIjYKBnh4ZJ0HEgC9HNppTpTV6hgI7ZOwZO6J5KZlEbzH...";
    Calendar    = "a3d6595737662df84b35deadee083703bcebd61e5abe13974bda474f6d19a7cd@group.calendar.google.com";
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);
```
 



```json title="Result"
{
 "kind": "calendar#calendar",
 "etag": "\"TKmlUu-rCWvGCZLbQ4hTqd8_K3U\"",
 "id": "48ff105e488eea0a588031479250116f2e769f150c2ca1274b7e79c4b057b46b@group.calendar.google.com",
 "summary": "New name",
 "description": "New description",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
