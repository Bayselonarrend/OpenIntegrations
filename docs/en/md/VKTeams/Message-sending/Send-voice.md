---
sidebar_position: 3
---

# Send voice
 Sends an audio file as a voice message



`Function SendVoice(Val Token, Val ChatID, Val File, Val FileType = "m4a", Val ReplyID = 0, Val Keyboard = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for sending |
  | File | --file | BinaryData, String | File for sending |
  | FileType | --type | String | Audio type: aac, ogg or m4a |
  | ReplyID | --reply | String, Number | Replying message id if necessary |
  | Keyboard | --keyboard | Array Of String | Buttons to the message if necessary |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
If you want the client to display this file as a playable voice message, it must be in aac, ogg, or m4a format

 Method at API documentation: [POST /messages/sendVoice](https://teams.vk.com/botapi/#/messages/post_messages_sendVoice)
:::
<br/>


```bsl title="Code example"
  Token   = FunctionParameters["VkTeams_Token"];
  ChatID  = FunctionParameters["VkTeams_ChatID2"];
  ReplyID = FunctionParameters["VkTeams_MessageID"];
  Text    = "File caption";
  
  File     = FunctionParameters["Audio2"] ; // URL
  FilePath = GetTempFileName("m4a"); // Path
  
  CopyFile(File, FilePath);
  
  FileBD = New BinaryData(FilePath); // Binary
  
  Result = OPI_VKTeams.SendVoice(Token, ChatID, File);
  
  OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (URL)", "VkTeams");
  
  Result = OPI_VKTeams.SendVoice(Token, ChatID, FilePath, ,ReplyID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (Path)", "VkTeams");
  
  Result = OPI_VKTeams.SendVoice(Token, ChatID, File);
```



```sh title="CLI command example"
    
  oint vkteams SendVoice --token "001.3501506236.091..." --chatid "689203963@chat.agent" --file "https://openintegrations.dev/test_data/song.m4a  // URL" --type %type% --reply "7402287649739767956" --keyboard %keyboard%

```

```json title="Result"

```
