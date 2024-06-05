---
sidebar_position: 1
---

# Get description events 



*Function GetEventDescription() Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|

 
 Returns: Key-Value Pair - Empty event template

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint gcalendar GetEventDescription


```


```json title="Result"

EventMatch = New Map;
 EventMatch.Insert("Description", ""); // Event description
 EventMatch.Insert("Title", "New event"); // Title events
 EventMatch.Insert("Venue", ""); // String description of the venue of the event
 EventMatch.Insert("StartDate", CurrentSessionDate()); // Date of start events
 EventMatch.Insert("EndDate", EventMatch["StartDate"] + 3600); // Date of end events
 EventMatch.Insert("ArrayOfAttachmentURLs", New Map); // Key - name, Value - URL to file
 EventMatch.Insert("SendNotifications", True); // Indication of sending notifications to participants

```
