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
    Refresh      = "27502667006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ОбновитьТокен(ClientID, ClientSecret, Refresh);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ОбновитьТокен --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --refresh "a95e9b66006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "access_token": "f08c0367006e9f06006b12e4000000010000072858e80ae95fa77cadd8ee34e8bbb7c9",
 "expires": 1728285936,
 "expires_in": 3600,
 "scope": "app",
 "domain": "oauth.bitrix.info",
 "server_endpoint": "https://oauth.bitrix.info/rest/",
 "status": "L",
 "client_endpoint": "https://b24-ar17wx.bitrix24.by/rest/",
 "member_id": "00168f0dd11ff00b4aeb8ce5befaa139",
 "user_id": 1,
 "refresh_token": "e00b2b67006e9f06006b12e400000001000007e35ad499ebd5b5cc1cd61ccd65ec7f32"
}
```
