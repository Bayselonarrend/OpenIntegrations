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
    Token  = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Result = OPI_GoogleCalendar.GetCalendarList(Token);
```



```sh title="CLI command example"
    
  oint gcalendar GetCalendarList --token %token%

```

```json title="Result"

```
