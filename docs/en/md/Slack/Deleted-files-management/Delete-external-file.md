---
sidebar_position: 5
---

# Delete external file
 Deletes an external file from Slack


*Function DeleteExternalFile(Val Token, Val FileID) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | FileID | --fileid | String | File identifier |

 
 Returns: Key-Value Pair - Serialized JSON response from Slack

```bsl title="Code example"
	
 
 FileID = "F070P52CU94";
 
 Response = OPI_Slack.DeleteExternalFile(Token, FileID); //Map
 Response = OPI_Tools.JSONString(Response); //JSON string
 

	
```

```sh title="CLI command example"
 
 oint slack DeleteExternalFile --token %token% --fileid "F070P52CU94"


```


```json title="Result"

{
 "ok": true
 }

```
