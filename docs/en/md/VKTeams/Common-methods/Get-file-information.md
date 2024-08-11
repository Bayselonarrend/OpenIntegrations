---
sidebar_position: 3
---

# Get information about file
 Gets information about a file by ID



`Function GetFileInformation(Val Token, Val FileID) Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | Token | --token | String | Bot token |
 | FileID | --fileid | String, Number | File ID |

 
 Returns: Map Of KeyAndValue - Serialized JSON response from VK Teams

<br/>

:::tip
Method at API documentation: [GET /files/getInfo](https://teams.vk.com/botapi/#/files/get_files_getInfo)
:::
<br/>


	


```sh title="CLI command example"
 
oint vkteams GetFileInformation --token %token% --fileid %fileid%

```

```json title="Result"
{
 "filename": "ImportantDocument.docx",
 "size": 24071,
 "type": "application",
 "url": "https://ub.icq.net/files/get/XrJ30TgJvcpZoiAEu1MC46e1MCbBs3NXwqSkBiZgCEkXOsNmPmAnw2XXpEM4WXMcylct3N2s3XwyMI5Cj7GDKtY6FmpmOHLgYC2xUanmVRf4gtn0zVatipXHgtriTJACrKfemXbqJuLCNOYZJieYS72mwqu1MC/%D0%92%D0%B0%D0%B6%D0%BD%D1%8B%D0%B9%D0%94%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82.docx",
 "ok": true
}
```
