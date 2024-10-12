---
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
    Token = "ya29.a0AcM612w6SWzMf3Ti1dSiFdgdLdXxLBjzKdXoLGuGDHoSXzb0uAKe5hJ-HPz1Njyp7HuHE6NnMnevQwbo0AR-yPAwfrA1OsMFZ_Fac2ASn...";
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
