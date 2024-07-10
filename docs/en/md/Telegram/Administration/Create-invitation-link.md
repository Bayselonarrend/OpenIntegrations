---
sidebar_position: 3
---

# Create invitation link
 Creates a link for joining a closed chat


<br/>


`Function CreateInvitationLink(Val Token, Val ChatID, Val Title = "", Val ExpirationDate = "", Val UserLimit = 0) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | Title | --title | String | Invitation title |
 | ExpirationDate | --expire | Date | Link expiration date (permanent if not specified) |
 | UserLimit | --limit | Number | User limit (infinite if not specified) |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
 Token = "6129457865:AAFyzNYOAFbu...";
 ChannelID = "@testsichee";
 Day = 86400;
 CurrentDate = OPI_Tools.GetCurrentDate();
 
 Title = "Link " + String(CurrentDate);
 Expiration = CurrentDate + Day;
 UnixExpiration = OPI_Tools.UNIXTime(Expiration);
 
 Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);
```
	


```sh title="CLI command example"
 
 oint telegram CreateInvitationLink --token "6129457865:AAFyzNYOAFbu..." --chat %chat% --title %title% --expire %expire% --limit %limit%

```

```json title="Result"
 {
 "ok": true,
 "result": {
 "invite_link": "https://t.me/+W-9MzjOejStiYzYy",
 "name": "Link 05/30/2024 12:34:59",
 "creator": {
 "id": 6129457865,
 "is_bot": true,
 "first_name": "Vitaly The Bot",
 "username": "sicheebot"
 },
 "expire_date": 1717155300,
 "member_limit": 200,
 "creates_join_request": false,
 "is_primary": false,
 "is_revoked": false
 }
}
```
