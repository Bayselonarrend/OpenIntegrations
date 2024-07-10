---
sidebar_position: 3
---

# Write a message
 Write a message to a user in the community's dialog




<br/>


*Function WriteMessage(Val Text, Val UserID, Val Communitytoken, Val Keyboard = "", Val Parameters = "") Export*

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Text | --text | String | Message text |
 | UserID | --user | String | Recipient user ID |
 | Communitytoken | --ct | String | Community chat bot token, which can be obtained in the settings |
 | Keyboard | --keyboard | String | JSON keyboard. See FormKeyboard |
 | Parameters | --auth | Structure Of String | Authorization JSON or path to .json |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK


```bsl title="Code example"
 
 KТ = "vk1.a.IzbBGUkYUvrNfMt_sknCcC66hyYifL0U1Bb...";
 Response = OPI_VK.WriteMessage("I am bot, but you - not >:)", 657811122, KТ,, Parameters);
 
 Response = OPI_Tools.JSONString(Response);
 
```
	


```sh title="CLI command example"
 
 oint vk WriteMessage --text %text% --user %user% --ct %ct% --keyboard %keyboard% --auth %auth%

```

```json title="Result"
 {
 "response": 7
 }
```
