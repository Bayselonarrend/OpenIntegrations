---
sidebar_position: 4
---

# Send audio
 Sends an audio file to a chat or channel


*Function SendAudio(Val Token, Val ChatID, Val Text, Val Audio, Val Keyboard = "", Val Markup = "Markdown") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | Text | --text | String | Message text |
 | Audio | --audio | BinaryData,String | Audio file |
 | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
 | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 ChatID = "461699897";
 ChannelID = "@testsichee";
 Text = "String value";
 Audio = "https://openintegrations.dev/test_data/song.mp3";
 
 AudioPath = GetTempFileName("mp3");
 CopyFile(Audio, AudioPath);
 
 AudioDD = New BinaryData(AudioPath);
 
 Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);

 Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);

 
 Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);

	
```

```sh title="CLI command example"
 
 oint telegram SendAudio --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --audio "https://openintegrations.dev/test_data/song.mp3" --keyboard %keyboard% --parsemode %parsemode%


```


```json title="Result"

{
 "ok": true,
 "result": {
 "message_id": 4641,
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
 "date": 1717072399,
 "audio": {
 "duration": 228,
 "file_name": "audio",
 "mime_type": "audio/mpeg",
 "title": "Dogs",
 "performer": "Motorhead",
 "file_id": "CQACAgIAAxkDAAISIWZYcg_Kxij0GylJNbAlQXeFsOL_AAKsUAACYCjISuJ28LqFPDf3NQQ",
 "file_unique_id": "AgADrFAAAmAoyEo",
 "file_size": 9229352
 },
 "caption": "String value"
 }
}

```
