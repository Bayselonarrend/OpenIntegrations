﻿---
sidebar_position: 9
---

# Get comment structure
 Get comment fields structure



`Function GetCommentStructure(Val Clear = False) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Clear | --empty | Boolean | True > structure with empty valuse, False > field descriptions at values |

  
  Returns:  Structure of KeyAndValue - Fields structure

<br/>




```bsl title="Code example"
    Result = OPI_Bitrix24.GetCommentStructure();
```



```sh title="CLI command example"
    
  oint bitrix24 GetCommentStructure --empty %empty%

```

```json title="Result"
{
 "AUTHOR_ID": "<comment author identifier>",
 "AUTHOR_NAME": "<Users name (optional)>",
 "AUTHOR_EMAIL": "<Users email (optional)>",
 "USE_SMILES": "<(Y|N) - parse comments for emoticons or not>",
 "POST_MESSAGE": "<Message text>",
 "UF_FORUM_MESSAGE_DOC": "<Array of files from disk to attach>"
}
```
