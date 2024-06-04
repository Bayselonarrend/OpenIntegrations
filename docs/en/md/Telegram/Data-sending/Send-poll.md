---
sidebar_position: 10
---

# Send poll
 Sends a poll with answer options


*Function SendPoll(Val Token, Val ChatID, Val Question, Val AnswersArray, Val Anonymous = True) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chat | String, Number | Target chat ID or ChatID*TopicID |
 | Question | --question | String | Poll question |
 | AnswersArray | --options | Array of String | Array of answer options |
 | Anonymous | --anonymous | Boolean | Poll anonymity |

 
 Returns: Key-Value Pair - Serialized JSON response from Telegram

```bsl title="Code example"
	
 Token = "6129457865:AAFyzNYOAFbu...";
 ChatID = "461699897";
 ChannelID = "@testsichee"; 
 Question = "What's your favorite color?";
 
 AnswersArray = New Array;
 AnswersArray.Add("Red");
 AnswersArray.Add("Yellow");
 AnswersArray.Add("Green");
 AnswersArray.Add("Blue");
 
 Result = OPI_Telegram.SendPoll(Token, ChatID, Question, AnswersArray, False);
 
 OPI_TestDataRetrieval.WriteLog(Result, "SendPoll", "Telegram");
 
 
 Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);
 
 OPI_TestDataRetrieval.WriteLog(Result, "SendPoll (channel)");

	
```

```sh title="CLI command example"
 
 oint telegram SendPoll --token "6129457865:AAFyzNYOAFbu..." --chat "461699897" --question "What's your favorite color?" --options %options% --anonymous %anonymous%

```


```json title="Result"

{
 "ok": true,
 "result": {
 "message_id": 4648,
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
 "date": 1717072475,
 "poll": {
 "id": "5388601346930772585",
 "question": "What's your favorite color?",
 "options": [
 {
 "text": "Red",
 "voter_count": 0
 },
 {
 "text": "Yellow",
 "voter_count": 0
 },
 {
 "text": "Green",
 "voter_count": 0
 },
 {
 "text": "Blue",
 "voter_count": 0
 }
 ],
 "total_voter_count": 0,
 "is_closed": false,
 "is_anonymous": false,
 "type": "regular",
 "allows_multiple_answers": false
 }
 }
}

```
