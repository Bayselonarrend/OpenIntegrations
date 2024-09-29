---
sidebar_position: 1
---

# Get list of calendars
 Gets an array of account calendars



`Function GetCalendarList(Val Token) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |

  
  Returns:  Map Of KeyAndValue - Array of calendar data mappings

<br/>




```bsl title="Code example"
    Token  = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Result = OPI_GoogleCalendar.GetCalendarList(Token);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarList --token %token%

```

```json title="Result"

```
