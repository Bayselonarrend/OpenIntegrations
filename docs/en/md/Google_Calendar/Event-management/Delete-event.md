---
sidebar_position: 7
---

# Delete event
 Deletes an event by ID


*Function DeleteEvent(Val Token, Val Calendar, Val Event) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |
 | Event | --event | String | Event ID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google

```bsl title="Code example"
	
 
 Response = OPI_GoogleCalendar.DeleteEvent(Token, "55868c32be16935f0...", "j4nonfcc0m2..."); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
	
```

```sh title="CLI command example"
 
 oint gcalendar DeleteEvent --token %token% --calendar %calendar% --event %event%


```


```json title="Result"

""

```
