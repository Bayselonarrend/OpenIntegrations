﻿---
sidebar_position: 9
---

# Get file block
 Make file block for SendMessage method



`Function GetFileBlock(Val Name, Val URL) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Name | --title | String | Picture name |
  | URL | --url | String | File URL |

  
  Returns:  Structure - FileBlock

<br/>

:::tip
Blocks at API documentation: [Link](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
:::
<br/>


```bsl title="Code example"
    Name = "Image";
    URL  = "https://openyellow.neocities.org/test_data/document.docx";

    Result = OPI_Bitrix24.GetFileBlock(Name, URL);
```



```sh title="CLI command example"
    
  oint bitrix24 GetFileBlock --title %title% --url %url%

```

```json title="Result"
{
 "FILE": {
  "NAME": "Image",
  "LINK": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx"
 }
}
```
