---
sidebar_position: 12
---

# Generate keyboard from array of buttons
 Generates a simple JSON keyboard from an array of buttons for a message or bottom panel



`Function FormKeyboardFromButtonArray(Val ButtonArray, Val UnderMessage = False, Val OneByOne = True) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ButtonArray | --buttons | Array of String | Array of buttons |
  | UnderMessage | --under | Boolean | Keyboard under the message or on the bottom panel |
  | OneByOne | --column | Boolean | True > buttons are displayed in a column, False > in a row |

  
  Returns:  String - Keyboard JSON

<br/>

:::tip
About keyboards in the API documentation: [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
:::
<br/>


```bsl title="Code example"
    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Result = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray);
```
 



```json title="Result"
"{\r\n \"keyboard\": [\r\n  [\r\n   {\r\n    \"text\": \"Button1\",\r\n    \"callback_data\": \"Button1\"\r\n   }\r\n  ],\r\n  [\r\n   {\r\n    \"text\": \"Button2\",\r\n    \"callback_data\": \"Button2\"\r\n   }\r\n  ],\r\n  [\r\n   {\r\n    \"text\": \"Button3\",\r\n    \"callback_data\": \"Button3\"\r\n   }\r\n  ]\r\n ],\r\n \"resize_keyboard\": true\r\n}"
```
