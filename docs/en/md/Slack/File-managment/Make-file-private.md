---
sidebar_position: 6
---

# Make file private
 Removes the public URL from the file. Requires user token



`Function MakeFilePrivate(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | User token |
  | FileID | --fileid | String | File identifier |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token  = "xoxb-6965308400114-696804637...";
    FileID = "F07QLU2LLTW";

    Result = OPI_Slack.MakeFilePrivate(Token, FileID);
```



```sh title="CLI command example"
    
  oint slack MakeFilePrivate --token %token% --fileid %fileid%

```

```json title="Result"
{
 "ok": true,
 "files": [
  {
   "id": "F07QV3GUUSG",
   "created": 1728328845,
   "timestamp": 1728328845,
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
   "url_private": "https://files.slack.com/files-pri/T06UD92BS3C-F07QV3GUUSG/megadoc.docx",
   "url_private_download": "https://files.slack.com/files-pri/T06UD92BS3C-F07QV3GUUSG/download/megadoc.docx",
   "media_display_type": "unknown",
   "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QV3GUUSG/megadoc.docx",
   "permalink_public": "https://slack-files.com/T06UD92BS3C-F07QV3GUUSG-04cdf73478",
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
