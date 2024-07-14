---
sidebar_position: 2
---

# Edit message
 Edit dialog message content



`Function EditMessage(Val URL, Val MessageID, Val Text = "", Val Attachments = "", Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | MessageID | --message | String, Number | ID of the message to be edited |
 | Text | --text | String | New message text |
 | Attachments | --blocks | Array of Structure | New blocks array |
 | Token | --token | String | Access token, when not-webhook method used |

 
 Returns: Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.message.update](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12117)
:::
<br/>


```bsl title="Code example"
 URL = FunctionParameters["Bitrix24_URL"];
 MessageID = FunctionParameters["Bitrix24_ChatMessageID"];
 
 Text = "New message text";
 
 Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text);
 
 
 URL = FunctionParameters["Bitrix24_Domain"];
 Token = FunctionParameters["Bitrix24_Token"];
 MessageID = FunctionParameters["Bitrix24_UserMessageID"];
 
 Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
 File = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";
 
 Attachments = New Array;
 Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1", Image));
 Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx", File));
 
 Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text, Attachments, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 EditMessage --url %url% --message %message% --text %text% --blocks %blocks% --token %token%

```

```json title="Result"
{
 "result": true,
 "time": {
 "start": 1720969165.17314,
 "finish": 1720969165.21621,
 "duration": 0.0430619716644287,
 "processing": 0.018265962600708,
 "date_start": "2024-07-14T14:59:25+00:00",
 "date_finish": "2024-07-14T14:59:25+00:00",
 "operating_reset_at": 1720969765,
 "operating": 0
 }
}
```
