---
sidebar_position: 11
---

# Answer button event
 Returns a response to the user when a keyboard button is pressed



`Function AnswerButtonEvent(Val Token, Val EventID, Val Text = "", Val URL = "", Val AsAlert = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | EventID | --queryid | String | Identifier of the callback query received by the bot |
  | Text | --text | String | Answer text |
  | URL | --url | String | URL to be opened by the client application |
  | AsAlert | --showalert | Boolean | Display the answer as an alert) |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
This method call should be used in response to receiving a callbackQuery event

 Method at API documentation: [GET /messages/answerCallbackQuery](https://teams.vk.com/botapi/#/messages/get_messages_answerCallbackQuery)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    LastID = 0;

    For N = 1 To 5 Do

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);
        Events = Result["events"];

        If Not Events.Count() = 0 Then

            For Each Event In Events Do

                callbackData = Event["payload"];

                If callbackData["callbackData"] = "ButtonEvent1" Then

                    EventID = callbackData["queryId"];
                    Result  = OPI_VKTeams.AnswerButtonEvent(Token, EventID, "Get it!");

                EndIf;

            EndDo;

            LastID = Events[Events.UBound()]["eventId"];

        EndIf;

    EndDo;
```



```sh title="CLI command example"
    
  oint vkteams AnswerButtonEvent --token "001.3501506236.091..." --queryid %queryid% --text %text% --url %url% --showalert %showalert%

```

```json title="Result"

```
