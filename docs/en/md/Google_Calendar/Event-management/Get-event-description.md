---
sidebar_position: 1
---

# Get event description 




`Function GetEventDescription() Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|

  
  Returns:  Map Of KeyAndValue - Empty event template

<br/>




```bsl title="Code example"
    Result = OPI_GoogleCalendar.GetEventDescription();
```



```sh title="CLI command example"
    
  oint gcalendar GetEventDescription

```

```json title="Result"
{
 "Description": "",
 "Title": "New event",
 "Venue": "",
 "StartDate": "2024-09-29T20:19:15.0257123Z",
 "EndDate": "2024-09-29T21:19:15.0257123Z",
 "ArrayOfAttachmentURLs": {},
 "SendNotifications": true
}
```
