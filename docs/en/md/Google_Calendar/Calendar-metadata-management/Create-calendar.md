﻿---
sidebar_position: 1
---

# Create calendar
 Creates an empty calendar



`Function CreateCalendar(Val Token, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Name | --title | String | Name of the created calendar |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612z6H4poMFq_1-p1k1-QF7c-gwUkVSsqTdSkNphsLEOb5P6mIEka1HO6Qtpa8blAWg966f9g85FujqfIsORbwU-wVy_3xEHh5ycBg...";
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);
```



```sh title="CLI command example"
    
  oint gcalendar CreateCalendar --token %token% --title %title%

```

```json title="Result"
{
  "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
  "hangoutsMeet"
  ]
  },
  "summary": "TestCalendar",
  "timeZone": "UTC",
  "id": "75b64bec8700a640b004af3491867ac5e479884794f529699da23e7009f7d691@group.calendar.google.com",
  "etag": "\"ZlOrbHnYjwJB0APkTQupgFm7F3s\"",
  "kind": "calendar#calendar"
  }
```
