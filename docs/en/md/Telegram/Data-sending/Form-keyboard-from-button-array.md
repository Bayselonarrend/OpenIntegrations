---
sidebar_position: 12
---

# Generate keyboard from array of buttons
 Generates a simple JSON keyboard from an array of buttons for a message or bottom panel


*Function FormKeyboardFromButtonArray(Val ButtonArray, Val UnderMessage = False, Val OneByOne = True) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ButtonArray | --buttons | Array of String | Array of buttons |
 | UnderMessage | --under | Boolean | Keyboard under the message or on the bottom panel |
 | OneByOne | --column | Boolean | True > buttons are displayed in a column, False > in a row |

 
 Returns: String - Keyboard JSON

```bsl title="Code example"
	
 
 ButtonArray = New Array;
 ButtonArray.Add("Great");
 ButtonArray.Add("Ok");
 ButtonArray.Add("Bad");
 
 Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray, True, True);
 

	
```

```sh title="CLI command example"
 
 oint telegram FormKeyboardFromButtonArray --buttons %buttons% --under %under% --column %column%

```


```json title="Result"

{
 "inline_keyboard":[
 [
 {
 "text":"\u041E\u0442\u043B\u0438\u0447\u043D\u043E",
 "callback_data":"\u041E\u0442\u043B\u0438\u0447\u043D\u043E"
 }
 ],
 [
 {
 "text":"\u041D\u043E\u0440\u043C\u0430\u043B\u044C\u043D\u043E",
 "callback_data":"\u041D\u043E\u0440\u043C\u0430\u043B\u044C\u043D\u043E"
 }
 ],
 [
 {
 "text":"\u041F\u043B\u043E\u0445\u043E",
 "callback_data":"\u041F\u043B\u043E\u0445\u043E"
 }
 ]
 ],
 "rows":1
 }

```
