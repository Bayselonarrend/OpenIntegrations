﻿---
sidebar_position: 3
---

# Create invitation link
 Creates a link for joining a closed chat



`Function CreateInvitationLink(Val Token, Val ChatID, Val Title = "", Val ExpirationDate = "", Val UserLimit = 0) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Title | --title | String | Invitation title |
  | ExpirationDate | --expire | Date | Link expiration date (permanent if not specified) |
  | UserLimit | --limit | Number | User limit (infinite if not specified) |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Telegram

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
    
  oint telegram CreateInvitationLink --token "6129457865:AAFyzNYOAFbu..." --chat %chat% --title "Link  + String(CurrentDate)" --expire %expire% --limit %limit%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "invite_link": "https://t.me/+hUgH4yjb_7wyZDBi",
  "name": "Link 09.10.2024 8:58:10",
  "creator": {
   "id": 6129457865,
   "is_bot": true,
   "first_name": "Бот Виталий",
   "username": "sicheebot"
  },
  "expire_date": 1728547090,
  "member_limit": 200,
  "creates_join_request": false,
  "is_primary": false,
  "is_revoked": false
 }
}
```
