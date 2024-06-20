---
sidebar_position: 3
---

# Обновить токен
 Обновляет токен по Refresh токену


*Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач Refresh) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --clientid | Строка | Client ID из настроек приложения |
  | ClientSecret | --clientsecret | Строка | Client secret из настроек приложения |
  | Refresh | --refresh | Строка | Refresh токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

```bsl title="Пример кода"
	
  ClientID     = "local.6667fc928a50a9.70414732";
  ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
  Refresh      = "a95e9b66006e9f06006b12e400000001000...";
  
  Результат = OPI_Bitrix24.ОбновитьТокен(ClientID, ClientSecret, Refresh);
	
```

```sh title="Пример команды CLI"
    
oint bitrix24 ОбновитьТокен --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --refresh "a95e9b66006e9f06006b12e400000001000..."

```


```json title="Результат"

{
 "access_token": "63a46866006e9f06006b12e4000000010000071997e1f54c1043e9f7193734af3018df",
 "expires": 1718133859,
 "expires_in": 3600,
 "scope": "app",
 "domain": "oauth.bitrix.info",
 "server_endpoint": "https://oauth.bitrix.info/rest/",
 "status": "L",
 "client_endpoint": "https://b24-ar17wx.bitrix24.by/rest/",
 "member_id": "00168f0dd11ff00b4aeb8ce5befaa139",
 "user_id": 1,
 "refresh_token": "53239066006e9f06006b12e4000000010000078523b1fc75d58d6f0fa98b4632bc70ce"
}

```
