---
sidebar_position: 1
---

# Get list of files
 Gets a list of files of the bot or channel


*Function GetFilesList(Val Token, Val Channel = "", Val PageNumber = 1) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Channel | --channel | String | Channel for selection |
 | PageNumber | --page | Number, String | Page number |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 PageNumber = 1;
 Channel = "C123456";
 
 Response = OPI_Slack.GetFilesList(Token, Channel, PageNumber); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint slack GetFilesList --token %token% --channel "C123456" --page "1"


```


```json title="Result"

{
 "ok": true,
 "files": [
 {
 "id": "F070V4U7Y4R",
 "created": 1713978714,
 "timestamp": 1713978714,
 "name": "megadoc.docx",
 "title": "NewFile",
 "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
 "filetype": "docx",
 "pretty_type": "Word Document",
 "user": "U06UG1CAYH2",
 "user_team": "T06UD92BS3C",
 "editable": false,
 "size": 24069,
 "mode": "hosted",
 "is_external": false,
 "external_type": "",
 "is_public": true,
 "public_url_shared": false,
 "display_as_bot": false,
 "username": "",
 "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070V4U7Y4R/megadoc.docx",
 "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070V4U7Y4R/download/megadoc.docx",
 "media_display_type": "unknown",
 "converted_pdf": "https://files.slack.com/files-tmb/T06UD92BS3C-F070V4U7Y4R-417b34221e/megadoc_converted.pdf",
 "thumb_pdf": "https://files.slack.com/files-tmb/T06UD92BS3C-F070V4U7Y4R-417b34221e/megadoc_thumb_pdf.png",
 "thumb_pdf_w": 909,
 "thumb_pdf_h": 1286,
 "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070V4U7Y4R/megadoc.docx",
 "channels": [
 "C06UFNUTKUL"
 ],
 "groups": [],
 "ims": [],
 "comments_count": 0
 }
 ]
 }

```
