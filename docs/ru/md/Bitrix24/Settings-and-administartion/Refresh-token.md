---
sidebar_position: 3
---

# Обновить токен
 Обновляет токен по Refresh токену



`Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач Refresh) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --clientid | Строка | Client ID из настроек приложения |
  | ClientSecret | --clientsecret | Строка | Client secret из настроек приложения |
  | Refresh | --refresh | Строка | Refresh токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
    ClientID     = "local.6667fc928a50a9.70414732";
    ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
    Refresh      = "39613067006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ОбновитьТокен(ClientID, ClientSecret, Refresh);
```
    



```json title="Результат"
{
 "access_token": "717e0567006e9f06006b12e400000001000007c2ebc8f80264531d4fc09a27052a7fe2",
 "expires": 1728413297,
 "expires_in": 3600,
 "scope": "app",
 "domain": "oauth.bitrix.info",
 "server_endpoint": "https://oauth.bitrix.info/rest/",
 "status": "L",
 "client_endpoint": "https://b24-ar17wx.bitrix24.by/rest/",
 "member_id": "00168f0dd11ff00b4aeb8ce5befaa139",
 "user_id": 1,
 "refresh_token": "61fd2c67006e9f06006b12e4000000010000070914b54013c4e30eb73b4c6524c61989"
}
```
