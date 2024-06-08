---
sidebar_position: 5
---

# Send document
 Sends a document to a chat or channel


*Function SendDocument(Val Token, Val ChatID, Val Text, Val Document, Val Keyboard = "", Val Markup = "Markdown") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | Text | --text | String | Message text |
 | Document | --doc | BinaryData,String | Document file |
 | Keyboard | --keyboard | String | Keyboard JSON or path to .json |
 | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 ChatID = "461699897";
 ChannelID = "@testsichee";
 Text = "String value";
 Document = "https://openintegrations.dev/test_data/document.docx";
 
 DocumentPath = GetTempFileName("docx");
 FileCopy(Document, DocumentPath);
 
 DocumentDD = New BinaryData(DocumentPath);
 
 Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);
 Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);
 Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD);
	
```

```sh title="CLI command example"
 
 oint telegram SendDocument --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --doc "https://openintegrations.dev/test_data/document.docx" --keyboard %keyboard% --parsemode %parsemode%


```


```json title="Result"

{
 "ok": true,
 "result": {
 "message_id": 4642,
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
 "date": 1717072414,
 "document": {
 "file_name": "document.docx",
 "mime_type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
 "file_id": "BQACAgIAAxkDAAISImZYch5MDU2ibeJ0S46yZfw6Dmb2AAKtUAACYCjISp3o6gzXeDCVNQQ",
 "file_unique_id": "AgADrVAAAmAoyEo",
 "file_size": 24069
 },
 "caption": "String value"
 }
}

```
