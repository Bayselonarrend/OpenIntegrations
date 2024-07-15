---
sidebar_position: 11
---

# Get fields structure for folder items filter
 Returns filter structure for child folder items



`Function GetFolderFilterStructure(Val URL, Val Clear = False, Val Token = "") Export`

 | Parameter | CLI option | Type | Destination |
 |-|-|-|-|
 | URL | --url | String | URL of webhook or a Bitrix24 domain, when token used |
 | Clear | --empty | Boolean | True > structure with empty values, False > field types at values |
 | Token | --token | String | Access token, when app auth method used |

 
 Returns: Structure of KeyAndValue - Fields structure 

<br/>

:::tip
Method at API documentation: [disk.folder.getfields](https://dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getfields.php)
:::
<br/>


```bsl title="Code example"
 URL = "https://b24-ar17wx.bitrix24.by/rest/1/4swokunb3tk7h7dt/";
 
 Result = OPI_Bitrix24.GetFolderFilterStructure(URL);
 
 
 URL = "b24-ar17wx.bitrix24.by";
 Token = "adf89366006e9f06006b12e400000001000...";
 
 Result = OPI_Bitrix24.GetFolderFilterStructure(URL, True, Token);
```
	


```sh title="CLI command example"
 
 oint bitrix24 GetFolderFilterStructure --url "b24-ar17wx.bitrix24.by" --empty %empty% --token "56898d66006e9f06006b12e400000001000..."

```

```json title="Result"
{
 "ID": "",
 "NAME": "",
 "TYPE": "",
 "CODE": "",
 "STORAGE_ID": "",
 "PARENT_ID": "",
 "CREATE_TIME": "",
 "UPDATE_TIME": "",
 "DELETE_TIME": "",
 "DELETED_TYPE": ""
}
```
