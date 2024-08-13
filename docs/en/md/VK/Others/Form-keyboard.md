---
sidebar_position: 1
---

# Create keyboard
 Forms a keyboard from an array of buttons



`Function FormKeyboard(Val ButtonArray) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | ButtonArray | --buttons | Array of String | Array of button titles |

  
  Returns:  String - Keyboard JSON

<br/>




```bsl title="Code example"
    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
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
