---
sidebar_position: 3
---

# Add external file
 Adds a new external file



`Function AddExternalFile(Val Token, Val URL, Val Title) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | URL | --url | String | URL to external file |
  | Title | --title | String | File title for Slack |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Slack

<br/>




```bsl title="Code example"
    Token = "xoxb-6965308400114-696804637...";
    Title = "NewFile";
    File  = "https://openyellow.neocities.org/test_data/document.docx"; // URL, Binary Data or Path to file

    Result = OPI_Slack.AddExternalFile(Token, File, Title);
```



```sh title="CLI command example"
    
  oint slack AddExternalFile --token %token% --url "https://opi.neocities.org/test_data/document.docx" --title %title%

```

```json title="Result"
{
 "ok": true,
 "file": {
  "id": "F07QYP172FP",
  "created": 1728454531,
  "timestamp": 1728454531,
  "name": "NewFile",
  "title": "NewFile",
  "mimetype": "application/vnd.slack-remote",
  "filetype": "remote",
  "pretty_type": "Remote",
  "user": "U06UG1CAYH2",
  "user_team": "T06UD92BS3C",
  "editable": false,
  "size": 0,
  "mode": "external",
  "is_external": true,
  "external_type": "app",
  "is_public": false,
  "public_url_shared": false,
  "display_as_bot": false,
  "username": "",
  "url_private": "https://slack.com/api/files.remote.add",
  "media_display_type": "unknown",
  "permalink": "https://openintegrationsgroup.slack.com/files/U06UG1CAYH2/F07QYP172FP/newfile",
  "comments_count": 0,
  "is_starred": false,
  "shares": {},
  "channels": [],
  "groups": [],
  "ims": [],
  "has_more_shares": false,
  "external_id": "3a61913c-c2ce-412b-a4b4-6875373db31a",
  "external_url": "https://slack.com/api/files.remote.add",
  "has_rich_preview": false,
  "file_access": "visible"
 }
}
```
