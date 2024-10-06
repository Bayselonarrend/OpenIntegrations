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
    Video     = "https://openyellow.neocities.org/test_data/video.mp4";

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
  "message_id": 8193,
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
  "date": 1728139241,
  "video": {
   "duration": 5,
   "width": 640,
   "height": 480,
   "file_name": "video",
   "mime_type": "video/mp4",
   "thumbnail": {
    "file_id": "AAMCAgADGQMAAiABZwFP6NNQ75k2NlYOhxfm1cqxRFsAAktbAAJHgRBIM_CHW8i09MEBAAdtAAM2BA",
    "file_unique_id": "AQADS1sAAkeBEEhy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "thumb": {
    "file_id": "AAMCAgADGQMAAiABZwFP6NNQ75k2NlYOhxfm1cqxRFsAAktbAAJHgRBIM_CHW8i09MEBAAdtAAM2BA",
    "file_unique_id": "AQADS1sAAkeBEEhy",
    "file_size": 20106,
    "width": 320,
    "height": 240
   },
   "file_id": "BAACAgIAAxkDAAIgAWcBT-jTUO-ZNjZWDocX5tXKsURbAAJLWwACR4EQSDPwh1vItPTBNgQ",
   "file_unique_id": "AgADS1sAAkeBEEg",
   "file_size": 1137878
  },
  "caption": "Строковое значение"
 }
}
```
