---
sidebar_position: 7
---

# Resend voice
 Sends a previously uploaded voice message by ID



`Function ResendVoice(Val Token, Val ChatID, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | ChatID | --chatid | String, Number | Chat ID for sending |
 | FileID | --fileid | String, Number | File ID of voice message |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /messages/sendVoice](https://teams.vk.com/botapi/#/messages/get_messages_sendVoice)
:::
<br/>


	


```sh title="CLI command example"
 
 oint vkteams ResendVoice --token "001.3501506236.091..." --chatid "AoLI0egLWBSLR1Ngn2w" --fileid "I000bPVBYaNQkn9Fg3oY0066ba35811bd"

```


