---
sidebar_position: 2
---

# Close dialog
 Closes an existing dialog


*Function CloseDialog(Val Token, Val Dialog) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | Dialog | --conv | String | Dialog ID |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 Dialog = "D06UAKK1C6R";
 
 Response = OPI_Slack.CloseDialog(Token, Dialog); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint slack CloseDialog --token %token% --conv "D06UAKK1C6R"

```


```json title="Result"

{
 "ok": true,
 "already_closed": false,
 "no_op": false
 }

```
