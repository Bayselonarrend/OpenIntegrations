---
sidebar_position: 1
---

# Create calendar
 Creates an empty calendar



`Function CreateCalendar(Val Token, Val Name) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Name | --title | String | Name of the created calendar |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Google

<br/>




```bsl title="Code example"
    Token = "ya29.a0AcM612wnBx7VbJAgYkpcebX-dM-G_-TZtCiwVmt4adr2IykVRe3FPVyOQxRy1ktwloO2Jy3CswXjOAu0GkipxL7M2CO4jbCkqzmci2d7-...";
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);
```



```sh title="CLI command example"
    
  oint gcalendar CreateCalendar --token %token% --title %title%

```

```json title="Result"

```
