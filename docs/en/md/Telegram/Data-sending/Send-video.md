---
sidebar_position: 3
---

# Send video
 Sends a video to a chat or channel



`Function SendVideo(Val Token, Val ChatID, Val Text, Val Video, Val Keyboard = "", Val Markup = "Markdown") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | Video | --video | BinaryData,String | Video file |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Text      = "Строковое значение";
    Video     = "https://openintegrations.dev/test_data/video.mp4";

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);
```



```sh title="CLI command example"
    
  oint telegram SendVideo --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --video "https://openintegrations.dev/test_data/video.mp4" --keyboard %keyboard% --parsemode %parsemode%

```

```json title="Result"
{
  "ok": true,
  "result": {
  "message_id": 4640,
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
  "date": 1717072376,
  "video": {
  "duration": 5,
  "width": 640,
  "height": 480,
  "file_name": "video",
  "mime_type": "video/mp4",
  "thumbnail": {
  "file_id": "AAMCAgADGQMAAhIgZlhx93ZvZz-UGKGqjCgPLXlYPSgAAqtQAAJgKMhKHu6gl3VqCfoBAAdtAAM1BA",
  "file_unique_id": "AQADq1AAAmAoyEpy",
  "file_size": 20106,
  "width": 320,
  "height": 240
  },
  "thumb": {
  "file_id": "AAMCAgADGQMAAhIgZlhx93ZvZz-UGKGqjCgPLXlYPSgAAqtQAAJgKMhKHu6gl3VqCfoBAAdtAAM1BA",
  "file_unique_id": "AQADq1AAAmAoyEpy",
  "file_size": 20106,
  "width": 320,
  "height": 240
  },
  "file_id": "BAACAgIAAxkDAAISIGZYcfd2b2c_lBihqowoDy15WD0oAAKrUAACYCjISh7uoJd1agn6NQQ",
  "file_unique_id": "AgADq1AAAmAoyEo",
  "file_size": 1137878
  },
  "caption": "String value"
  }
  }
```
