﻿---
sidebar_position: 2
---

# Send image
 Sends an image to a chat or channel



`Function SendImage(Val Token, Val ChatID, Val Text, Val Image, Val Keyboard = "", Val Markup = "Markdown") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | Image | --picture | BinaryData,String | Image file |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token = "6129457865:AAFyzNYOAFbu...";
  ChatID = "461699897";
  ChannelID = "@testsichee";
  Text = "String value";
  Image = "https://openintegrations.dev/test_data/picture.jpg";
  
  ImagePath = GetTempFileName("png");
  FileCopy(Image, ImagePath);
  
  ImageDD = New BinaryData(ImagePath);
  
  Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);
  
  Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);
  
  Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);
```



```sh title="CLI command example"
    
  oint telegram SendImage --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --picture "https://openintegrations.dev/test_data/picture.jpg" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8304,
  "from": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "chat": {
   "id": 461699897,
   "first_name": "Anton",
   "last_name": "Titowets",
   "username": "JKIee",
   "type": "private"
  },
  "date": 1728453303,
  "photo": [
   {
    "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADcwADNgQ",
    "file_unique_id": "AQAD4-QxG9SO8Et4",
    "file_size": 1568,
    "width": 90,
    "height": 67
   },
   {
    "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADbQADNgQ",
    "file_unique_id": "AQAD4-QxG9SO8Ety",
    "file_size": 21633,
    "width": 320,
    "height": 240
   },
   {
    "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADeAADNgQ",
    "file_unique_id": "AQAD4-QxG9SO8Et9",
    "file_size": 99260,
    "width": 800,
    "height": 600
   },
   {
    "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADeQADNgQ",
    "file_unique_id": "AQAD4-QxG9SO8Et-",
    "file_size": 218651,
    "width": 1280,
    "height": 960
   },
   {
    "file_id": "AgACAgIAAxkDAAIfmWb-MR8PQhrvZHiqLmG6UdiAAznzAALj5DEb1I7wSxB3bmqDIveAAQADAgADdwADNgQ",
    "file_unique_id": "AQAD4-QxG9SO8Et8",
    "file_size": 650214,
    "width": 2560,
    "height": 1920
   }
  ],
  "caption": "Строковое значение"
 }
}
```
