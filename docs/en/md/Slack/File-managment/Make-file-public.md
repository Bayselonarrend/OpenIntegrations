---
sidebar_position: 5
---

# Make file public
 Creates a public URL for the file. Requires user token



`Function MakeFilePublic(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | User token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07QLU2LLTW";

    Result = OPI_Slack.MakeFilePublic(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack MakeFilePublic --token %token% --fileid %fileid%

```

```json title="Result"
{
 "ok": true,
 "files": [
  {
   "id": "F07QC80L07Q",
   "created": 1728140464,
   "timestamp": 1728140464,
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
   "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F07QC80L07Q/megadoc.docx",
   "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F07QC80L07Q/download/megadoc.docx",
   "media_display_type": "unknown",
   "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QC80L07Q/megadoc.docx",
   "permalink_public": "https://slack-files.com/T06UD92BS3C-F07QC80L07Q-c69a470141",
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
