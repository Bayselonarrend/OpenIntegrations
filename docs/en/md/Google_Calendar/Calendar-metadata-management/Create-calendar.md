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
    Token = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);
```



```sh title="CLI command example"
    
  oint gcalendar CreateCalendar --token %token% --title %title%

```

```json title="Result"
{
 "kind": "calendar#calendar",
 "etag": "\"f-Xduc312TYuzWZZ-yIpBJJfeyo\"",
 "id": "60613d53c4670abdceec3e7693ca475b0e88dc1678db7210521356b4940a6148@group.calendar.google.com",
 "summary": "TestCalendar",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
