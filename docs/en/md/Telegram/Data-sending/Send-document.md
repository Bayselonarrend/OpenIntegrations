﻿---
sidebar_position: 5
---

# Send document
 Sends a document to a chat or channel



`Function SendDocument(Val Token, Val ChatID, Val Text, Val Document, Val Keyboard = "", Val Markup = "Markdown", Val FileName = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Text | --text | String | Message text |
  | Document | --doc | BinaryData, String | Document file |
  | Keyboard | --keyboard | String | Keyboard. See FormKeyboardFromButtonArray |
  | Markup | --parsemode | String | Text processing type (HTML, Markdown, MarkdownV2) |
  | FileName | --filename | String | Custom displayed file name with extension, if necessary |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

<br/>

:::tip
Method at API documentation: [sendDocument](https://core.telegram.org/bots/api#senddocument)
:::
<br/>


```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Text      = "Строковое значение";
    Document  = "https://openyellow.neocities.org/test_data/document.docx";

    DocumentPath = GetTempFileName("docx");
    CopyFile(Document, DocumentPath);

    DocumentDD = New BinaryData(DocumentPath);

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document, , , "customname.docx");

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD, , , "customname.docx");
```



```sh title="CLI command example"
    
  oint telegram SendDocument --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --text "String value" --doc "https://openintegrations.dev/test_data/document.docx" --keyboard %keyboard% --parsemode %parsemode% --filename %filename%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8307,
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
  "date": 1728453390,
  "document": {
   "file_name": "document.docx",
   "mime_type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
   "file_id": "BQACAgIAAxkDAAIgc2cGGw4a6yPdiNLubNQsFLQQPLHoAAJPWgAC_cg4SJF9HYfiILIbNgQ",
   "file_unique_id": "AgADT1oAAv3IOEg",
   "file_size": 24069
  },
  "caption": "Строковое значение"
 }
}
```
