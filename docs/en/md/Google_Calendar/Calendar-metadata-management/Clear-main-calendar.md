---
sidebar_position: 4
---

# Clear primary calendar
 Clears the event list of the primary calendar


<br/>


`Function ClearMainCalendar(Val Token) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google





```bsl title="Code example"
 
 Response = OPI_GoogleCalendar.ClearMainCalendar(Token);
 
```
	


```sh title="CLI command example"
 
 oint gcalendar ClearMainCalendar --token %token%

```

```json title="Result"
 ""
```
