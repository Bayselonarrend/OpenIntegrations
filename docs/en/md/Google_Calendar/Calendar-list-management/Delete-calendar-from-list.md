---
sidebar_position: 4
---

# Remove calendar from list
 Removes a calendar from the user's list


<br/>


`Function DeleteCalendarFromList(Val Token, Val Calendar) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | Calendar | --calendar | String | Calendar ID |

 
 Returns: Map Of KeyAndValue - serialized JSON response from Google





```bsl title="Code example"
 
 Response = OPI_GoogleCalendar.DeleteCalendarFromList(Token, "55868c32be16935f0..."); //Map
 Response = OPI_Tools.JSONString(Response); //String
 
```
	


```sh title="CLI command example"
 
 oint gcalendar DeleteCalendarFromList --token %token% --calendar %calendar%

```

```json title="Result"
 ""
```
