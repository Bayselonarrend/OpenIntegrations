---
sidebar_position: 6
---

# Make file private
 Removes the public URL from the file. Requires user token


<br/>


`Function MakeFilePrivate(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | User token |
 | FileID | --fileid | String | File identifier |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




	


```sh title="CLI command example"
 
 oint slack MakeFilePrivate --token %token% --fileid %fileid%

```


