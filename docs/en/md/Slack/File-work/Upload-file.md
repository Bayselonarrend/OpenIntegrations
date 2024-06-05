---
sidebar_position: 2
---

# Upload file
 Uploads a file to Slack servers


*Function UploadFile(Val Token, Val File, Val FileName, Val Title, Val Channel = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | File | --file | String, BinaryData | File for upload |
 | FileName | --filename | String | File name with extension |
 | Title | --title | String | File name in Slack |
 | Channel | --channel | String | Channel ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 FileName = "megadoc.docx";
 File = New BinaryData("D:\" + FileName);
 Title = "NewFile";
 Channel = "C123456";
 
 Response = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel); //Map
 Response = OPI_Tools.JSONString(Response);//JSON string
 

	
```

```sh title="CLI command example"
 
 oint slack UploadFile --token %token% --file %file% --filename "megadoc.docx" --title %title% --channel "C123456"


```


```json title="Result"

{
 "ok": true,
 "files": [
 {
 "id": "F070SS4UHNZ",
 "created": 1714146549,
 "timestamp": 1714146549,
 "name": "megadoc.docx",
 "title": "NewFile",
 "mimetype": "",
 "filetype": "",
 "pretty_type": "",
 "user": "U06UG1CAYH2",
 "user_team": "T06UD92BS3C",
 "editable": false,
 "size": 24069,
 "mode": "hosted",
 "is_external": false,
 "external_type": "",
 "is_public": false,
 "public_url_shared": false,
 "display_as_bot": false,
 "username": "",
 "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F070SS4UHNZ/megadoc.docx",
 "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F070SS4UHNZ/download/megadoc.docx",
 "media_display_type": "unknown",
 "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F070SS4UHNZ/megadoc.docx",
 "permalink_public": "https://slack-files.com/T06UD92BS3C-F070SS4UHNZ-e68bef4a91",
 "comments_count": 0,
 "is_starred": false,
 "shares": {},
 "channels": [],
 "groups": [],
 "ims": [],
 "has_more_shares": false,
 "has_rich_preview": false,
 "file_access": "visible"
 }
 ]
 }

```
