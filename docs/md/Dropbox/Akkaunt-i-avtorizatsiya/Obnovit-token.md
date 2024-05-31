---
sidebar_position: 3
---

# Обновить токен
 Получает новый токен на основе рефреш токена


*Функция ОбновитьТокен(Знач КлючПриложения, Знач СекретПриложения, Знач РефрешТокен) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | КлючПриложения | --appkey | Строка | Ключ приложения |
  | СекретПриложения | --appsecret | Строка | Секрет приложения |
  | РефрешТокен | --refresh | Строка | Рефреш токен |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

```bsl title="Пример кода"
	
    Ключ   = "oynqxds...";
    Секрет = "tk2oewn...";
    Рефреш = "MJIG2TBhD-kAAAAAAAAAAd3oNph_4iTy...";
    
    Результат = OPI_Dropbox.ОбновитьТокен(Ключ, Секрет, Рефреш);

	
```

```sh title="Пример команд CLI"
    
  oint dropbox ОбновитьТокен --appkey %appkey% --appsecret %appsecret% --refresh %refresh%

```


```json title="Результат"

{
 "access_token": "sl.B2M8yVLTS_ojO3UsFs2tRlXxkFh50RLOkroi3SLCwcjA2xX58JY__GXKh9vPGnGcfDkkTJJYB1Wn9tFvj6cRs3w04TnfaBQnJiOfUb58UHexTCAdck9xNFIBAQjuAQKUtkoht66bvsu4oh6Wl6gQpvU",
 "token_type": "bearer",
 "expires_in": 14400
}

```
