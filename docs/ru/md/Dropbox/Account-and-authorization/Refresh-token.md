---
sidebar_position: 3
---

# Обновить токен
 Получает новый токен на основе рефреш токена



`Функция ОбновитьТокен(Знач КлючПриложения, Знач СекретПриложения, Знач РефрешТокен) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | КлючПриложения | --appkey | Строка | Ключ приложения |
  | СекретПриложения | --appsecret | Строка | Секрет приложения |
  | РефрешТокен | --refresh | Строка | Рефреш токен |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Dropbox

<br/>




```bsl title="Пример кода"
    КлючПриложения   = ПараметрыФункции["Dropbox_Appkey"];
    СекретПриложения = ПараметрыФункции["Dropbox_Appsecret"];
    РефрешТокен      = ПараметрыФункции["Dropbox_Refresh"];

    Результат = OPI_Dropbox.ОбновитьТокен(КлючПриложения, СекретПриложения, РефрешТокен);
```



```sh title="Пример команды CLI"
    
  oint dropbox ОбновитьТокен --appkey "oynqxds..." --appsecret "tk2oewn..." --refresh "oZFWg3DmZ_IAAAAAAAAAAWilOA0M1SjV..."

```

```json title="Результат"
{
 "access_token": "sl.B2M8yVLTS_ojO3UsFs2tRlXxkFh50RLOkroi3SLCwcjA2xX58JY__GXKh9vPGnGcfDkkTJJYB1Wn9tFvj6cRs3w04TnfaBQnJiOfUb58UHexTCAdck9xNFIBAQjuAQKUtkoht66bvsu4oh6Wl6gQpvU",
 "token_type": "bearer",
 "expires_in": 14400
}
```
