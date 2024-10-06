﻿---
sidebar_position: 9
---

# Send contact
 Sends a contact with name and phone number



`Function SendContact(Val Token, Val ChatID, Val Name, Val LastName, Val Phone, Val Keyboard = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Name | --name | String | Contact name |
  | LastName | --surname | String | Contact last name |
  | Phone | --phone | String | Contact phone number |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
    Token     = "6129457865:AAFyzNYOAFbu...";
    ChatID    = "461699897";
    ChannelID = "@testsichee";
    Name      = "Петр";
    LastName  = "Петров";
    Phone     = "88005553535";

    Result = OPI_Telegram.SendContact(Token, ChatID , Name, LastName, Phone);

    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, LastName, Phone);
```



```sh title="CLI command example"
    
  oint telegram SendContact --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --name "John" --surname "Doe" --phone "88005553535" --keyboard %keyboard%

```

```json title="Result"
{
 "ok": true,
 "result": {
  "message_id": 8201,
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
  "date": 1728139365,
  "contact": {
   "phone_number": "88005553535",
   "first_name": "Петр",
   "last_name": "Петров"
  }
 }
}
```
