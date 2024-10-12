---
sidebar_position: 2
---

# Get calendar
 Gets calendar information by ID



`Function GetCalendarMetadata(Val Token, Val Calendar) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token    = "ya29.a0AcM612yqBU-Js-ZwvMX9kOgTqr1bzVlotSXxpjuDiy-VQFNrbVcJqWC-p_l2W_Ng_se_7j6PbCOWHu1waCLQEAilKYg3xb2Q18DG_cMfA...";
    Calendar = "9776ffc9103041e891559c22442cd210f397ca598957939d3a9fa15edfccfd62@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarMetadata --token %token% --calendar %calendar%

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
