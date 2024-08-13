---
sidebar_position: 2
---

# Получить токен
 Получает токен по коду авторизации



`Функция ПолучитьТокен(Знач ClientID, Знач ClientSecret, Знач Code) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --clientid | Строка | Client ID из настроек приложения |
  | ClientSecret | --clientsecret | Строка | Client secret из настроек приложения |
  | Code | --code | Строка | Code из авторизации через браузер |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>




```bsl title="Пример кода"
    ClientID     = "local.6667fc928a50a9.70414732";
    ClientSecret = "ZeKyeYIgy2NsHZqsIHY6GfG1V...";
    Code         = "2b096866006e9f06006b12e400000001000007fc1bc681f7ed7f13f2d449980628008c";

    Результат = OPI_Bitrix24.ПолучитьТокен(ClientID, ClientSecret, Code);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьТокен --clientid "local.6667fc928a50a9.70414732" --clientsecret "ZeKyeYIgy2NsHZqsIHY6GfG1V..." --code "2b096866006e9f06006b12e400000001000007fc1bc681f7ed7f13f2d449980628008c"

```

```json title="Результат"
    {
 "error": "expired_token",
 "error_description": "The authorization token provided has expired."
}

```
