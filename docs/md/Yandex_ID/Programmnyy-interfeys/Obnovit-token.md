---
sidebar_position: 3
---

# Обновить токен
 Обновляет токен по Refresh token


*Функция ОбновитьТокен(Знач ClientId, Знач ClientSecret, Знач RefreshToken) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientId | --id | Строка | Client id |
  | ClientSecret | --secret | Строка | Client secret |
  | RefreshToken | --refresh | Строка | Refresh token |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Yandex

```bsl title="Пример кода"
	

  Ответ = OPI_YandexID.ОбновитьТокен(ClientId, ClientSecret, RefreshToken); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint yandex ОбновитьТокен --id %id% --secret %secret% --refresh %refresh%

```


```json title="Результат"



```
