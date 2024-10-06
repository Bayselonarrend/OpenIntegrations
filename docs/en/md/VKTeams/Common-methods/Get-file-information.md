﻿---
sidebar_position: 3
---

# Get information about file
 Gets information about a file by ID



`Function GetFileInformation(Val Token, Val FileID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Bot token |
  | FileID | --fileid | String, Number | File ID |

  
  Returns:  Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /files/getInfo](https://teams.vk.com/botapi/#/files/get_files_getInfo)
:::
<br/>


```bsl title="Code example"
    Token  = "001.3501506236.091...";
    FileID = "Z7w4zb94bLtkJDICBfzVuG66f69e921bd";

    Result = OPI_VKTeams.GetFileInformation(Token, FileID);
```



```sh title="CLI command example"
    
  oint vkteams GetFileInformation --token "001.3501506236.091..." --fileid "sXhpbA5K2ZCOdG5ROIfRan66ba356d1bd"

```

```json title="Result"
{
 "filename": "ImportantDocument.docx",
 "size": 24071,
 "type": "application",
 "url": "https://ub.icq.net/files/get/PkvQAo2YldyvXisvMZDGTAHZDGcn3LU1FGOgySWEC7rGScXbaSIspwH19ryR3GzD7BC1pnAkgSHDye9S5Y9LKISAyYCIhMjyeGvBFJtGig2QlGaIIzxSR7VUYIyxRdzIhgBAMShnuKPsHVZKtSGxP9KIBpMZDG/ImportantDocument.docx",
 "ok": true
}
```
