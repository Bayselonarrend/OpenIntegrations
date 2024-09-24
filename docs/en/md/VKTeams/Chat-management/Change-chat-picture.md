---
sidebar_position: 2
---

# Change chat picture
 Changes the chat avatar picture



`Function ChangeChatPicture(Val Token, Val ChatID, Val File) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | ChatID | --chatid | String, Number | Chat ID |
  | File | --file | BinaryData, String | Image file |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [POST ​/chats​/avatar​/set](https://teams.vk.com/botapi/#/chats/post_chats_avatar_set)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    ChatID = "AoLI0egLWBSLR1Ngn2w";

    File     = "https://openintegrations.dev/test_data/spy2.png"; // URL
    FilePath = GetTempFileName("png"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, File);

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FilePath);

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FileBD);
```



```sh title="CLI command example"
    
  oint vkteams ChangeChatPicture --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --file "https://openintegrations.dev/test_data/spy2.png"

```

```json title="Result"
{
 "ok": true
}
```
