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
  | GIF | --gif | BinaryData,String | GIF file |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Text      = "Строковое значение";
    GIF       = "https://openintegrations.dev/test_data/animation.gif";

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
  "message_id": 4643,
  "from": {
  "id": 6129457865,
  "is_bot": true,
  "first_name": "Vitaly The Bot",
  "username": "sicheebot"
  },
  "chat": {
  "id": 461699897,
  "first_name": "Anton",
  "last_name": "Titowets",
  "username": "JKIee",
  "type": "private"
  },
  "date": 1717072423,
  "animation": {
  "file_name": "animation.gif.mp4",
  "mime_type": "video/mp4",
  "duration": 3,
  "width": 220,
  "height": 220,
  "thumbnail": {
  "file_id": "AAMCAgADGQMAAhIjZlhyJr32tGqAiRbJXXmTK6ATld0AAq5QAAJgKMhKlmRvtTyqyUgBAAdtAAM1BA",
  "file_unique_id": "AQADrlAAAmAoyEpy",
  "file_size": 11352,
  "width": 220,
  "height": 220
  },
  "thumb": {
  "file_id": "AAMCAgADGQMAAhIjZlhyJr32tGqAiRbJXXmTK6ATld0AAq5QAAJgKMhKlmRvtTyqyUgBAAdtAAM1BA",
  "file_unique_id": "AQADrlAAAmAoyEpy",
  "file_size": 11352,
  "width": 220,
  "height": 220
  },
  "file_id": "CgACAgIAAxkDAAISI2ZYcia99rRqgIkWyV15kyugE5XdAAKuUAACYCjISpZkb7U8qslINQQ",
  "file_unique_id": "AgADrlAAAmAoyEo",
  "file_size": 84940
  },
  "document": {
  "file_name": "animation.gif.mp4",
  "mime_type": "video/mp4",
  "thumbnail": {
  "file_id": "AAMCAgADGQMAAhIjZlhyJr32tGqAiRbJXXmTK6ATld0AAq5QAAJgKMhKlmRvtTyqyUgBAAdtAAM1BA",
  "file_unique_id": "AQADrlAAAmAoyEpy",
  "file_size": 11352,
  "width": 220,
  "height": 220
  },
  "thumb": {
  "file_id": "AAMCAgADGQMAAhIjZlhyJr32tGqAiRbJXXmTK6ATld0AAq5QAAJgKMhKlmRvtTyqyUgBAAdtAAM1BA",
  "file_unique_id": "AQADrlAAAmAoyEpy",
  "file_size": 11352,
  "width": 220,
  "height": 220
  },
  "file_id": "CgACAgIAAxkDAAISI2ZYcia99rRqgIkWyV15kyugE5XdAAKuUAACYCjISpZkb7U8qslINQQ",
  "file_unique_id": "AgADrlAAAmAoyEo",
  "file_size": 84940
  },
  "caption": "String value"
  }
  }
```
