---
sidebar_position: 12
---

# Make action button
 Forms an action button for the message keyboard (see SendTextMessage)



`Function MakeActionButton(Val Text, Val Value = "", Val URL = "", Val Style = "base") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Text | --text | String | Button text |
  | Value | --data | String | The value returned in the event. Only if the URL is not filled |
  | URL | --url | String | URL to create the page open button. Only if the Value is not filled in |
  | Style | --style | String | Button style: primary, attention or base |

  
  Returns:  Structure - Button for keyboard

<br/>




```bsl title="Code example"
    Keyboard         = New Array;
    ButtonsLineArray = New Array;

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button1", "ButtonEvent1", , "attention"));

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button2", , "https://openintegrations.dev"));

    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);
```



```sh title="CLI command example"
    
  oint vkteams MakeActionButton --text %text% --data %data% --url %url% --style %style%

```

```json title="Result"

```
