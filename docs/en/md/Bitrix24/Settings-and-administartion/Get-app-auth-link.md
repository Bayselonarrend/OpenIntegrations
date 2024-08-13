---
sidebar_position: 1
---

# Get app authentication link
 Forms a link for authorization via the browser



`Function GetAppAuthLink(Val Domain, Val ClientID) Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Domain | --domain | String | Current Bitrix URL (like 'portal.bitrix24.com') |
  | ClientID | --clientid | String | Client ID from app settings |

  
  Returns:  String - URL for browser transition

<br/>




```bsl title="Code example"
    Domain   = "b24-ar17wx.bitrix24.by";
    ClientID = "local.6667fc928a50a9.70414732";

    Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);
```



```sh title="CLI command example"
    
  oint bitrix24 GetAppAuthLink --domain "b24-ar17wx.bitrix24.by" --clientid "local.6667fc928a50a9.70414732"

```

```json title="Result"
"https://b24-ar17wx.bitrix24.by/oauth/authorize/?client_id=local.6667fc928a50a9.70414732"
```
