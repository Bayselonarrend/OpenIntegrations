﻿---
sidebar_position: 21
---

# Get chats structure
 Get chat fields structure



`Function GetChatStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty values, False > field types at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetChatStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetChatStructure --empty %empty%

```

```json title="Result"
{
 "TYPE": "<Chat type OPEN (Public) | CHAT (Private)>",
 "TITLE": "<Chat title>",
 "DESCRIPTION": "<Chat description>",
 "COLOR": "<Chat color: RED, GREEN, MINT, LIGHT_BLUE, DARK_BLUE, PURPLE, AQUA, ...>",
 "MESSAGE": "<First chat message>",
 "USERS": "<Chat members array>",
 "AVATAR": "<Base64 chat picture>",
 "OWNER_ID": "<ID of chat owner. Current user by default>"
}
```
