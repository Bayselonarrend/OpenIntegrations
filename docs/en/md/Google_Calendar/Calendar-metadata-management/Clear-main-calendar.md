---
sidebar_position: 4
---

# Clear primary calendar
 Clears the event list of the primary calendar



`Function ClearMainCalendar(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612yhdixI9i7TxOgZIa9kwI5a42S4MfHVMdYZeolUKySbI7x1gtyAhGDlso57x7N6WNRpp9BZX0N3MQOcZEdR6lDciUHI4nof3u9xi...";

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);
```



```sh title="CLI command example"
    
  oint gcalendar ClearMainCalendar --token %token%

```

```json title="Result"
""
```
