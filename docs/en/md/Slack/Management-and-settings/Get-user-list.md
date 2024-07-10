---
sidebar_position: 3
---

# Get user list
 Gets a list of users in the workspace


<br/>


`Function GetUserList(Val Token, Val Cursor = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Cursor | --cursor | String | Pointer from the previous request, if the result rows > 100 |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




```bsl title="Code example"
 
 
 Response = OPI_Slack.GetUserList(Token, Cursor); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
```
	


```sh title="CLI command example"
 
 oint slack GetUserList --token %token% --cursor %cursor%

```

```json title="Result"
 {
 "ok": true,
 "members": [
 {
 "id": "USLACKBOT",
 "team_id": "T06UD92BS3C",
 "name": "slackbot",
 "deleted": false,
 "color": "757575",
 "real_name": "Slackbot",
 "tz": "America/Los_Angeles",
 "tz_label": "Pacific Daylight Time",
 "tz_offset": -25200,
 "profile": {
 "title": "",
 "phone": "",
 "skype": "",
 "real_name": "Slackbot",
 "real_name_normalized": "Slackbot",
 "display_name": "Slackbot",
 "display_name_normalized": "Slackbot",
 "fields": {},
 "status_text": "",
 "status_emoji": "",
 "status_emoji_display_info": [],
 "status_expiration": 0,
 "avatar_hash": "sv41d8cd98f0",
 "always_active": true,
 "first_name": "slackbot",
 "last_name": "",
 "image_24": "https://a.slack-edge.com/80588/img/slackbot_24.png",
 "image_32": "https://a.slack-edge.com/80588/img/slackbot_32.png",
 "image_48": "https://a.slack-edge.com/80588/img/slackbot_48.png",
 "image_72": "https://a.slack-edge.com/80588/img/slackbot_72.png",
 "image_192": "https://a.slack-edge.com/80588/marketing/img/avatars/slackbot/avatar-slackbot.png",
 "image_512": "https://a.slack-edge.com/80588/img/slackbot_512.png",
 "status_text_canonical": "",
 "team": "T06UD92BS3C"
 },
 "is_admin": false,
 "is_owner": false,
 "is_primary_owner": false,
 "is_restricted": false,
 "is_ultra_restricted": false,
 "is_bot": false,
 "is_app_user": false,
 "updated": 0,
 "is_email_confirmed": false,
 "who_can_share_contact_card": "EVERYONE"
 },
 {
 "id": "U06UABH3APP",
 "team_id": "T06UD92BS3C",
 "name": "bayselonarrend",
 "deleted": false,
 "color": "9f69e7",
 "real_name": "Anton Titovets",
 "tz": "Europe/Moscow",
 "tz_label": "Moscow Time",
 "tz_offset": 10800,
 "profile": {
 "title": "",
 "phone": "",
 "skype": "",
 "real_name": "Anton Titovets",
 "real_name_normalized": "Anton Titovec",
 "display_name": "",
 "display_name_normalized": "",
 "fields": null,
 "status_text": "",
 "status_emoji": "",
 "status_emoji_display_info": [],
 "status_expiration": 0,
 "avatar_hash": "65215daf7a4a",
 "image_original": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_original.png",
 "is_custom_image": true,
 "email": "bayselonarrend@gmail.com",
 "first_name": "Anton",
 "last_name": "Titovets",
 "image_24": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_24.png",
 "image_32": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_32.png",
 "image_48": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_48.png",
 "image_72": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_72.png",
 "image_192": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_192.png",
 "image_512": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_512.png",
 "image_1024": "https://avatars.slack-edge.com/2024-04-15/6965308574562_65215daf7a4a35eddf9c_1024.png",
 "status_text_canonical": "",
 "team": "T06UD92BS3C"
 },
 "is_admin": true,
 "is_owner": true,
 "is_primary_owner": true,
 "is_restricted": false,
 "is_ultra_restricted": false,
 "is_bot": false,
 "is_app_user": false,
 "updated": 1713202518,
 "is_email_confirmed": true,
 "who_can_share_contact_card": "EVERYONE"
 },
 {
 "id": "U06UG1CAYH2",
 "team_id": "T06UD92BS3C",
 "name": "openintegrations",
 "deleted": false,
 "color": "4bbe2e",
 "real_name": "OpenIntegrations",
 "tz": "America/Los_Angeles",
 "tz_label": "Pacific Daylight Time",
 "tz_offset": -25200,
 "profile": {
 "title": "",
 "phone": "",
 "skype": "",
 "real_name": "OpenIntegrations",
 "real_name_normalized": "OpenIntegrations",
 "display_name": "",
 "display_name_normalized": "",
 "fields": null,
 "status_text": "",
 "status_emoji": "",
 "status_emoji_display_info": [],
 "status_expiration": 0,
 "avatar_hash": "gada2f598798",
 "api_app_id": "A06TYNH45RV",
 "always_active": false,
 "bot_id": "B06TZ0MJV5M",
 "first_name": "OpenIntegrations",
 "last_name": "",
 "image_24": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=24&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-24.png",
 "image_32": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=32&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-32.png",
 "image_48": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=48&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-48.png",
 "image_72": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=72&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-72.png",
 "image_192": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=192&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-192.png",
 "image_512": "https://secure.gravatar.com/avatar/ada2f598798f33d7af084f0c8793a209.jpg?s=512&d=https%3A%2F%2Fa.slack-edge.com%2Fdf10d%2Fimg%2Favatars%2Fava_0007-512.png",
 "status_text_canonical": "",
 "team": "T06UD92BS3C"
 },
 "is_admin": false,
 "is_owner": false,
 "is_primary_owner": false,
 "is_restricted": false,
 "is_ultra_restricted": false,
 "is_bot": true,
 "is_app_user": false,
 "updated": 1713205238,
 "is_email_confirmed": false,
 "who_can_share_contact_card": "EVERYONE"
 }
 ],
 "cache_ts": 1714215811,
 "response_metadata": {
 "next_cursor": ""
 }
 }
```
