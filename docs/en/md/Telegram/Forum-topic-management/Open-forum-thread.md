﻿---
sidebar_position: 5
---

# Open forum thread
 Reopens a previously closed forum thread


*Function OpenForumThread(Val Token, Val ChatID, Val ThreadID = "") ExportReturn ManageForumThreadState(Token, ChatID, 1, ThreadID);EndFunction*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Token |
 | ChatID | --forum | String, Number | Thread chat ID |
 | ThreadID | --topic | String, Number | Thread ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 Chat = "-1001971186208";
 Topic = "2673";

 Result = OPI_Telegram.OpenForumThread(Token, Chat); // Opens main topic
 
 OPI_TestDataRetrieval.WriteLog(Result, "OpenForumTopic (main)");
 
 
 Result = OPI_Telegram.OpenForumThread(Token, Chat, Topic);

	
```

```sh title="CLI command example"
 
 oint telegram OpenForumThread --token "6129457865:AAFyzNYOAFbu..." --forum %forum% --topic %topic%

```


```json title="Result"

{
 "ok": true,
 "result": true
}

```