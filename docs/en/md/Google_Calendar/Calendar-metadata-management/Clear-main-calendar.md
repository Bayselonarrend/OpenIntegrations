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
    Token = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);
```



```sh title="CLI command example"
    
  oint gcalendar ClearMainCalendar --token %token%

```

```json title="Result"
null
```
