---
sidebar_position: 7
---

# Create a keyboard from an array of buttons
 Returns a keyboard structure for messages



`Function CreateKeyboardFromArrayButton(Val ButtonArray, Val ButtonColor = "#2db9b9") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ButtonArray | --buttons | Array of String | Array of buttons |
  | ButtonColor | --color | String | HEX color of buttons with # at the beginning |

  
  Returns:  Structure - Create a keyboard from an array of buttons:


<br/>




```bsl title="Code example"
    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Result = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);
```



```sh title="CLI command example"
    
  oint viber CreateKeyboardFromArrayButton --buttons %buttons% --color %color%

```

```json title="Result"

```
