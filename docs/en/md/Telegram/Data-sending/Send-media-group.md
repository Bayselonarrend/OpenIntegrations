---
sidebar_position: 7
---

# Send media group
 Sends a set of files to a chat or channel. Media types: audio, document, photo, video


*Function SendMediaGroup(Val Token, Val ChatID, Val Text, Val FileMapping, Val Keyboard = "", Val Markup = "Markdown") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | Text | --text | String | Message text |
 | FileMapping | --media | Map of String | File JSON or path to .json |
 | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
 | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 
 Token = "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ";
 Description = "Pictures group";
 FileMapping = New Map;
 FileMapping.Insert("C:\OPI\alpaca.png", "photo");
 FileMapping.Insert("C:\OPI\alpaca_text.png", "photo");
 
 Response = OPI_Telegram.SendMediaGroup(Token, 1234567890, Description, FileMapping); //Map
 Response = OPI_Tools.JSONString(Response_); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint telegram SendMediaGroup --token "111111111:AACccNYOAFbuhAL5GAaaBbbbOjZYFvLZZZZ" --chat %chat% --text %text% --media %media% --keyboard %keyboard% --parsemode %parsemode%


```


```json title="Result"

{
 "ok": true,
 "result": [
 {
 "message_id": 4644,
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
 "date": 1717072435,
 "media_group_id": "13736579485142714",
 "photo": [
 {
 "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADcwADNQQ",
 "file_unique_id": "AQADmtkxG77-sUp4",
 "file_size": 1568,
 "width": 90,
 "height": 67
 },
 {
 "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADbQADNQQ",
 "file_unique_id": "AQADmtkxG77-sUpy",
 "file_size": 21633,
 "width": 320,
 "height": 240
 },
 {
 "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeAADNQQ",
 "file_unique_id": "AQADmtkxG77-sUp9",
 "file_size": 99260,
 "width": 800,
 "height": 600
 },
 {
 "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADeQADNQQ",
 "file_unique_id": "AQADmtkxG77-sUp-",
 "file_size": 218651,
 "width": 1280,
 "height": 960
 },
 {
 "file_id": "AgACAgIAAxkDAAISJGZYcjMH_sZQUquUAgQ99ai1gbJJAAKa2TEbvv6xSgxyd39G8AuyAQADAgADdwADNQQ",
 "file_unique_id": "AQADmtkxG77-sUp8",
 "file_size": 650214,
 "width": 2560,
 "height": 1920
 }
 ],
 "caption": "String value"
 },
 {
 "message_id": 4645,
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
 "date": 1717072435,
 "media_group_id": "13736579485142714",
 "video": {
 "duration": 5,
 "width": 640,
 "height": 480,
 "file_name": "video1",
 "mime_type": "video/mp4",
 "thumbnail": {
 "file_id": "AAMCAgADGQMAAhIlZlhyM8blQGUtyAJ_ndJRjfrrHT8AAq9QAAJgKMhK7ZjJRS8XMtIBAAdtAAM1BA",
 "file_unique_id": "AQADr1AAAmAoyEpy",
 "file_size": 20106,
 "width": 320,
 "height": 240
 },
 "thumb": {
 "file_id": "AAMCAgADGQMAAhIlZlhyM8blQGUtyAJ_ndJRjfrrHT8AAq9QAAJgKMhK7ZjJRS8XMtIBAAdtAAM1BA",
 "file_unique_id": "AQADr1AAAmAoyEpy",
 "file_size": 20106,
 "width": 320,
 "height": 240
 },
 "file_id": "BAACAgIAAxkDAAISJWZYcjPG5UBlLcgCf53SUY366x0_AAKvUAACYCjISu2YyUUvFzLSNQQ",
 "file_unique_id": "AgADr1AAAmAoyEo",
 "file_size": 1137878
 }
 }
 ]
}

```
