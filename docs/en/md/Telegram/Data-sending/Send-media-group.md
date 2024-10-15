---
sidebar_position: 7
---

# Send media group
 Sends a set of files to a chat or channel. Media types: audio, document, photo, video



`Function SendMediaGroup(Val Token, Val ChatID, Val Text, Val FileMapping, Val Keyboard = "", Val Markup = "Markdown") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | FileMapping | --media | Map of KeyAndValue | File collection: Key > File, Value > Media Type |
  | Keyboard | --keyboard | String | Keyboard. See FormKeyboardFromButtonArray |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [sendMediaGroup](https://core.telegram.org/bots/api#sendmediagroup)
:::
<br/>


```bsl title="Code example"
    Token  = "6129457865:AAFyzNYOAFbu...";
    ChatID = "461699897";
    Text   = "Строковое значение";
    Image  = "https://api.athenaeum.digital/test_data/picture.jpg";
    Video  = "https://api.athenaeum.digital/test_data/video.mp4";

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    MediaGroup = New Map;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(VideoDD  , "video");

    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);
```
 



```json title="Result"
{
 "ok": true,
 "result": [
  {
   "message_id": 8310,
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
   "date": 1728453419,
   "media_group_id": "13827627353456290",
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
  },
  {
   "message_id": 8311,
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
   "date": 1728453419,
   "media_group_id": "13827627353456290",
   "video": {
    "duration": 5,
    "width": 640,
    "height": 480,
    "file_name": "video1",
    "mime_type": "video/mp4",
    "thumbnail": {
     "file_id": "AAMCAgADFQdnBhsq6-bI-FK3CYb2iTi0EMaRSQACU1oAAv3IOEhuDaGGTZyj9AEAB20AAzYE",
     "file_unique_id": "AQADU1oAAv3IOEhy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "thumb": {
     "file_id": "AAMCAgADFQdnBhsq6-bI-FK3CYb2iTi0EMaRSQACU1oAAv3IOEhuDaGGTZyj9AEAB20AAzYE",
     "file_unique_id": "AQADU1oAAv3IOEhy",
     "file_size": 20106,
     "width": 320,
     "height": 240
    },
    "file_id": "BAACAgIAAxUHZwYbKuvmyPhStwmG9ok4tBDGkUkAAlNaAAL9yDhIbg2hhk2co_Q2BA",
    "file_unique_id": "AgADU1oAAv3IOEg",
    "file_size": 1137878
   }
  }
 ]
}
```
