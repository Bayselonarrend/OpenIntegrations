---
sidebar_position: 2
---

# Send file
 Sends the file to the chat



`Function SendFile(Val Token, Val ChatID, Val File, Val Text = "", Val FileName = "", Val Markup = "MarkdownV2") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID for sending |
  | File | --file | BinaryData, String | File for sending |
  | Text | --text | String | File caption |
  | FileName | --filename | String | Displayed file name |
  | Markup | --parsemod | String | Markup type for message text: MarkdownV2 or HTML |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [POST /messages/sendFile](https://teams.vk.com/botapi/#/messages/post_messages_sendFile)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";
    Text   = "File caption";

    File     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx"; // URL
    FilePath = GetTempFileName("docx"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendFile(Token, ChatID, File);

    Result = OPI_VKTeams.SendFile(Token, ChatID, FilePath, Text);

    Result = OPI_VKTeams.SendFile(Token, ChatID, FileBD, Text, "ImportantDocument.docx");
```



```sh title="CLI command example"
    
  oint vkteams SendFile --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --file "https://openintegrations.dev/test_data/document.docx // URL" --text "File caption" --filename %filename% --parsemod %parsemod%

```

```json title="Result"
{
 "fileId": "vqgXEg5z1gyjeolUD8vFEK66bb96aa1bd",
 "msgId": "7402676069402149083",
 "ok": true
}
```
