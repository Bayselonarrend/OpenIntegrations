﻿---
sidebar_position: 1
---

# Get list of bases
 Gets the list of available bases



`Function GetListOfBases(Val Token, Val Indent = "") Export`

  | Parameter | CLI option | Type | Description |
  |-|-|-|-|
  | Token | --token | String | Token |
  | Indent | --offset | String | Next page identifier of the base list from the previous request |

  
  Returns:  Map Of KeyAndValue - serialized JSON response from Airtable

<br/>




```bsl title="Code example"
    Token = "patNn4BXW66Yx3pdj.5b93c53cab554a8387de02d...";

    Result = OPI_Airtable.GetListOfBases(Token);
```



```sh title="CLI command example"
    
  oint airtable GetListOfBases --token %token% --offset %offset%

```

```json title="Result"
{
 "bases": [
  {
   "id": "appGarzKZ0lu3gzoa",
   "name": "Test",
   "permissionLevel": "create"
  },
  {
   "id": "app9WRfJirwn3yXuG",
   "name": "Product catalog",
   "permissionLevel": "create"
  },
  {
   "id": "app6gigUYTzlDEq4X",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app5hJGyK8asYYe1Q",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appRQ6VxxOZb40Uwi",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appM6FaGofV2XSfFA",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "apptm8Xqo7TwMaipQ",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appsyQyGrF8aVN2Wm",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "applEsyJmBRm12AuN",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appbh1wYGbZlmn3pN",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "apppkKYsw7O1Gqhxl",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appIHzEhKAimg9S2p",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app5Zyj15QZisbqvA",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "app05ybJZ2aiF7jiV",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appKbK1rnu08kOueO",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appBTTgSQtzCkrp4V",
   "name": "База из Оинт",
   "permissionLevel": "create"
  },
  {
   "id": "appDtM9dK5yzXduUB",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appqyGu9Cdx9xWvEs",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appczCGkB55A13rQ2",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appxClK6G6i2DREOB",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appsYySkvo8kafUdd",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appw2EFeyyNgwmhP6",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appqEloLDyI7p6uzS",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appdTFa0GMiOdaxVp",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appuREJLUMSxU9Tww",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appQwerTglYZLYkLl",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "apptPCnUGDn0M76to",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appgg50vNZwX1aZmu",
   "name": "Тестовая база",
   "permissionLevel": "create"
  },
  {
   "id": "appHB3hm34ZkAjflT",
   "name": "TestDatabase",
   "permissionLevel": "create"
  },
  {
   "id": "appuHDfwXADAD5QDj",
   "name": "TestDatabase",
...
```
