---
sidebar_position: 8
---

# Send location
 Sends location by geographic latitude and longitude to a chat or channel



`Function SendLocation(Val Token, Val ChatID, Val Latitude, Val Longitude, Val Keyboard = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
  | Latitude | --lat | String, Number | Geographic latitude |
  | Longitude | --long | String, Number | Geographic longitude |
  | Keyboard | --keyboard | String | Keyboard JSON or path to .json |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from Telegram

<br/>




```bsl title="Code example"
  Token     = "6129457865:AAFyzNYOAFbu...";
  ChatID    = "461699897";
  ChannelID = "@testsichee";
  Width     = "48.87373649724122";
  Longitude = "48.87373649724122";
  
  Result = OPI_Telegram.SendLocation(Token, ChatID, Width, Longitude);
  
  Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);
```



```sh title="CLI command example"
    
  oint telegram SendLocation --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --lat %lat% --long "48.87373649724122" --keyboard %keyboard%

```

```json title="Result"
{
  "ok": true,
  "result": {
  "message_id": 4646,
  "from": {
  "id": 6129457865,
  "is_bot": true,
  "first_name": "Vitaly The Bot",
  "username": "sicheebot"
  },
  "chat": {
  "id": 461699897,
  "first_name": "Anton",
  "last_name": "Titowets",
  "username": "JKIee",
  "type": "private"
  },
  "date": 1717072442,
  "location": {
  "latitude": 48.873739,
  "longitude": 48.873733
  }
  }
  }
```
