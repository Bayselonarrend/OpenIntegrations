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
    Token       = "ya29.a0AcM612zmTq3HijDy5D8xu-llkoj4aTlkgkrZ4LGSZcpCOnX1Z6xu9IsTLXFZSJu8uVsYxHj0ih5glQrF0yWTomhAPTGm1M9Kk7ZvYIwpm...";
    Calendar    = "c3e1276b51960f0e037480209bde23a7fded89b36e9d689e0d00951403165f59@group.calendar.google.com";
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);
```



```sh title="CLI command example"
    
  oint gcalendar EditCalendarMetadata --token %token% --calendar %calendar% --title "TestCalendar (change.)" --description "TestDescription"

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
