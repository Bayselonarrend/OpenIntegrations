---
sidebar_position: 1
---

# Get description events 





<br/>


*Function GetEventDescription() Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|

 
 Returns: Map Of KeyAndValue - Empty event template


	


```sh title="CLI command example"
 
 oint gcalendar GetEventDescription

```

```json title="Result"
 EventMap = New Map;
 EventMap.Insert("Description", ""); // Event description
 EventMap.Insert("Title", "New event"); // Title events
 EventMap.Insert("Venue", ""); // String description of the venue of the event
 EventMap.Insert("StartDate", CurrentSessionDate()); // Date of start events
 EventMap.Insert("EndDate", EventMap["StartDate"] + 3600); // Date of end events
 EventMap.Insert("ArrayOfAttachmentURLs", New Map); // Key - name, Value - URL to file
 EventMap.Insert("SendNotifications", True); // Indication of sending notifications to participants
```
