---
sidebar_position: 1
---

# Generate code retrieval link
 Returns URL for browser authorization


*Function FormCodeRetrievalLink(Val ClientID, Val Calendar = True, Val Drive = True, Val Sheets = True) Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | ClientID | --id | String | Client ID |
 | Calendar | --calendar | Boolean | Calendar methods permission |
 | Drive | --drive | Boolean | Drive methods permission |
 | Sheets | --sheets | Boolean | Sheets methods permission |

 
 Returns: String - Code retrieval link

```bsl title="Code example"
	

	
```

```sh title="CLI command example"
 
 oint google FormCodeRetrievalLink --id %id% --calendar %calendar% --drive %drive% --sheets %sheets%

```


```json title="Result"



```
