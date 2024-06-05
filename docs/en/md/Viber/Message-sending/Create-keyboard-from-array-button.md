---
sidebar_position: 7
---

# Create a keyboard from an array of buttons
 Returns a keyboard structure for messages


*Function CreateKeyboardFromArrayButton(Val ButtonArray, Val ButtonColor = "#2db9b9") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ButtonArray | --buttons | Array of String | Array of buttons |
 | ButtonColor | --color | String | HEX color of buttons with # at the beginning |

 
 Returns: Structure - Create a keyboard from an array of buttons:


```bsl title="Code example"
	
 
 ButtonArray = New Array;
 ButtonArray.Add("Button 1");
 ButtonArray.Add("Button 2");
 ButtonArray.Add("Button 3");
 
 Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray); //Structure
 JSON = OPI_Tools.JSONString(Keyboard); //String
 

	
```

```sh title="CLI command example"
 
 oint viber CreateKeyboardFromArrayButton --buttons %buttons% --color %color%


```


```json title="Result"

{
 "Buttons": [
 {
 "ActionType": "reply",
 "ActionBody": "Button 1",
 "Text": "Button 1",
 "BgColor": "#2db9b9",
 "Coloumns": 3
 },
 {
 "ActionType": "reply",
 "ActionBody": "Button 2",
 "Text": "Button 2",
 "BgColor": "#2db9b9",
 "Coloumns": 3
 },
 {
 "ActionType": "reply",
 "ActionBody": "Button 3",
 "Text": "Button 3",
 "BgColor": "#2db9b9",
 "Coloumns": 3
 }
 ],
 "Type": "keyboard"
 }

```
