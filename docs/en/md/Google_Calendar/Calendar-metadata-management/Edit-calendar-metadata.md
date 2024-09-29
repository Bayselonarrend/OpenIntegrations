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
    Token       = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar    = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
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
 "etag": "\"JdIz8lQzaU3RJOOasfFDICU1wDQ\"",
 "id": "739cf8d11d0517973f88bc93554f2f43e832f38e012b391be0ad17d266a850bc@group.calendar.google.com",
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
