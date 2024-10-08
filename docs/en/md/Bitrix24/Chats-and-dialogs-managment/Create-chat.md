---
sidebar_position: 1
---

# Create chat
 Creates a new chat based on the field structure



`Function CreateChat(Val URL, Val ChatStructure, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | ChatStructure | --fields | Structure of KeyAndValue | Chat fields structure. See GetChatStructure |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [im.chat.add](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12093)
:::
<br/>


```bsl title="Code example"
    Image = "https://openyellow.neocities.org/test_data/picture.jpg";
    OPI_TypeConversion.GetBinaryData(Image);

    B64Image = GetBase64StringFromBinaryData(Image);

    MembersArray = New Array;
    MembersArray.Add(10);
    MembersArray.Add(1);

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"       , "OPEN");
    ChatStructure.Insert("TITLE"      , "New chat");
    ChatStructure.Insert("DESCRIPTION", "This is a new chat");
    ChatStructure.Insert("COLOR"      , "GREEN");
    ChatStructure.Insert("MESSAGE"    , "Welcome to new chat");
    ChatStructure.Insert("USERS"      , MembersArray);
    ChatStructure.Insert("AVATAR"     , B64Image);
    ChatStructure.Insert("OWNER_ID"   , 1);

    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure);

    URL   = "b24-ar17wx.bitrix24.by";
    Token = "37d1fe66006e9f06006b12e400000001000...";

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"  , "CHAT");
    ChatStructure.Insert("TITLE" , "Private chat");
    ChatStructure.Insert("USERS" , MembersArray);

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure, Token);
```



```sh title="CLI command example"
    
  oint bitrix24 CreateChat --url "b24-ar17wx.bitrix24.by" --fields %fields% --token "fe3fa966006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "result": 976,
 "time": {
  "start": 1728329179.58042,
  "finish": 1728329179.70485,
  "duration": 0.124430894851685,
  "processing": 0.0935420989990234,
  "date_start": "2024-10-07T22:26:19+03:00",
  "date_finish": "2024-10-07T22:26:19+03:00",
  "operating_reset_at": 1728329779,
  "operating": 0
 }
}
```
