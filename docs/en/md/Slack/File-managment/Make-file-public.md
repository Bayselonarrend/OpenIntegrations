﻿---
sidebar_position: 5
---

# Make file public
 Creates a public URL for the file. Requires user token



`Function MakeFilePublic(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | User token |
 | FileID | --fileid | String | File identifier |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from Slack

<br/>




	


```sh title="CLI command example"
 
 oint slack MakeFilePublic --token %token% --fileid %fileid%

```


