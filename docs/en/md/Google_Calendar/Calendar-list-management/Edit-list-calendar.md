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
    Token          = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Calendar       = "47826632f9a0502adba79d3cbf90c5d4040622779e07bb8ed56964a2e4f8492a@group.calendar.google.com";
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
