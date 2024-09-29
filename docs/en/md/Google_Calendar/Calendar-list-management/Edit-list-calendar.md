---
sidebar_position: 5
---

# Edit list calendar
 Edits the properties of a calendar from the user's list



`Function EditListCalendar(Val Token, Val Calendar, Val PrimaryColor, Val SecondaryColor, Val Hidden = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Calendar | --calendar | String | Calendar ID |
  | PrimaryColor | --primary | String | HEX primary color (#ffffff) |
  | SecondaryColor | --secondary | String | HEX secondary color (#ffffff) |
  | Hidden | --hidden | Boolean | Hidden calendar |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token          = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Calendar       = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token, Calendar, PrimaryColor, SecondaryColor, False);
```



```sh title="CLI command example"
    
  oint gcalendar EditListCalendar --token %token% --calendar %calendar% --primary %primary% --secondary %secondary% --hidden %hidden%

```

```json title="Result"

```
