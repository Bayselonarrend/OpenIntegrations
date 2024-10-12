---
sidebar_position: 6
---

# Send GIF
 Sends a GIF to a chat or channel



`Function SendGif(Val Token, Val ChatID, Val Text, Val GIF, Val Keyboard = "", Val Markup = "Markdown") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | GIF | --gif | BinaryData, String | GIF file |
  | Keyboard | --keyboard | String | Keyboard. See FormKeyboardFromButtonArray |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [sendAnimation](https://core.telegram.org/bots/api#sendanimation)
:::
<br/>


```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Text      = "Строковое значение";
    GIF       = "https://api.athenaeum.digital/test_data/animation.gif";

    GifPath = GetTempFileName("gif");
    CopyFile(GIF, GifPath);

    GifDD = New BinaryData(GifPath);

    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);
```



```sh title="CLI command example"
    
  oint telegram SendGif --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --gif "https://openintegrations.dev/test_data/animation.gif" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8309,
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
  "date": 1728453403,
  "animation": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "duration": 3,
   "width": 220,
   "height": 220,
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiB1ZwYbG5XFI99d3EFZLIRqZTuOqk8AAlFaAAL9yDhI7o6IErbGQG0BAAdtAAM2BA",
    "file_unique_id": "AQADUVoAAv3IOEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiB1ZwYbG5XFI99d3EFZLIRqZTuOqk8AAlFaAAL9yDhI7o6IErbGQG0BAAdtAAM2BA",
    "file_unique_id": "AQADUVoAAv3IOEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIgdWcGGxuVxSPfXdxBWSyEamU7jqpPAAJRWgAC_cg4SO6OiBK2xkBtNgQ",
   "file_unique_id": "AgADUVoAAv3IOEg",
   "file_size": 84941
  },
  "document": {
   "file_name": "animation.gif.mp4",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiB1ZwYbG5XFI99d3EFZLIRqZTuOqk8AAlFaAAL9yDhI7o6IErbGQG0BAAdtAAM2BA",
    "file_unique_id": "AQADUVoAAv3IOEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiB1ZwYbG5XFI99d3EFZLIRqZTuOqk8AAlFaAAL9yDhI7o6IErbGQG0BAAdtAAM2BA",
    "file_unique_id": "AQADUVoAAv3IOEhy",
    "file_size": 11352,
    "width": 220,
    "height": 220
   },
   "file_id": "CgACAgIAAxkDAAIgdWcGGxuVxSPfXdxBWSyEamU7jqpPAAJRWgAC_cg4SO6OiBK2xkBtNgQ",
   "file_unique_id": "AgADUVoAAv3IOEg",
   "file_size": 84941
  },
  "caption": "Строковое значение"
 }
}
```
