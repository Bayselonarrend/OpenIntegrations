---
sidebar_position: 1
---

# Open dialog
 Opens a new dialog with one or more users


*Function OpenDialog(Val Token, Val ArrayOfUsers) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ArrayOfUsers | --users | Array of String | User ID Array |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 ArrayOfUsers = New Array;
 ArrayOfUsers.Add("U123456");
 ArrayOfUsers.Add("U654321");
 
 Response = OPI_Slack.OpenDialog(Token, ArrayOfUsers); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 
 
	
```

```sh title="CLI command example"
 
 oint slack OpenDialog --token %token% --users %users%


```


```json title="Result"

{
 "ok": true,
 "no_op": false,
 "already_open": false,
 "channel": {
 "id": "D06UAKK1C6R"
 }
 }

```
