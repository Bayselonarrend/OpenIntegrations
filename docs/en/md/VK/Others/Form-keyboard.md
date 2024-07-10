---
sidebar_position: 1
---

# Create keyboard
 Forms a keyboard from an array of buttons




<br/>


*Function FormKeyboard(Val ButtonArray) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ButtonArray | --buttons | Array of String | Array of button titles |

 
 Returns: String - Keyboard JSON


```bsl title="Code example"
 
 ButtonArray = New Array;
 ButtonArray.Add("Button 1");
 ButtonArray.Add("Button 2");
 
 Keyboard = OPI_VK.FormKeyboard(ButtonArray);
 KТ = "vk1.a.IzbBGUkYUvrNfMt_sknCcC66hyYifL0U1Bb8CVYC...";
 Response = OPI_VK.WriteMessage("I am bot, but you - not >:)", 657846756, KТ, Keyboard, Parameters);
 
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk FormKeyboard --buttons %buttons%

```

```json title="Result"
 {
 "buttons": [
 [
 {
 "action": {
 "type": "text",
 "label": "Button 1"
 }
 },
 {
 "action": {
 "type": "text",
 "label": "Button 2"
 }
 }
 ]
 ],
 "one_time": false
 }
```
