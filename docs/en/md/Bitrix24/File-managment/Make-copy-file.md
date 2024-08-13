---
sidebar_position: 8
---

# Copy file
 Copy file from one destination to another



`Function MakeCopyFile(Val URL, Val FileID, Val FolderID, Val Token = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
  | FileID | --fileid | String, Number | Original file ID |
  | FolderID | --folderid | String, Number | ID of copy destination folder |
  | Token | --token | String | Access token, when app auth method used |

  
  Returns:  Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API

<br/>

:::tip
Method at API documentation: [disk.file.copyto](https://dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
:::
<br/>


```bsl title="Code example"
  FolderID = FunctionParameters["Bitrix24_HookFolderID"];
  FileID   = FunctionParameters["Bitrix24_FileID"];
  
  URL = FunctionParameters["Bitrix24_URL"];
  
  Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID);
  
  OPI_TestDataRetrieval.WriteLog(Result, "MakeCopyFile (wh)", "Bitrix24");
  
  FolderID = FunctionParameters["Bitrix24_FolderID"];
  
  URL   = FunctionParameters["Bitrix24_Domain"];
  Token = FunctionParameters["Bitrix24_Token"];
  
  Result = OPI_Bitrix24.MakeCopyFile(URL, FileID, FolderID, Token);
  
  OPI_TestDataRetrieval.WriteLog(Result, "MakeCopyFile", "Bitrix24");
  
  Check_BitrixObject(Result);
```



```sh title="CLI command example"
    
  oint bitrix24 MakeCopyFile --url %url% --fileid %fileid% --folderid %folderid% --token %token%

```

```json title="Result"

```
