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
    Token    = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Calendar = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarMetadata --token %token% --calendar %calendar%

```

```json title="Result"
{
 "kind": "calendar#calendar",
 "etag": "\"klRYf05J3Y9cPjTJJHiba73QR5Q\"",
 "id": "0407d5e8cec991521b015ca45e5eecddf1b2b0c56357efd07f4ee341cf489372@group.calendar.google.com",
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
