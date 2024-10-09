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
 "StartDate": "2024-10-09T09:12:24.0203603Z",
 "EndDate": "2024-10-09T10:12:24.0203603Z",
 "ArrayOfAttachmentURLs": {},
 "SendNotifications": true
}
```
