---
sidebar_position: 3
---

# Обновить токен
 Обновляет токен по Refresh token


*Функция ОбновитьТокен(Знач ClientID, Знач ClientSecret, Знач RefreshToken) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --id | Строка | Client ID |
  | ClientSecret | --secret | Строка | Client secret |
  | RefreshToken | --refresh | Строка | Refresh token |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	

  Ответ = OPI_GoogleWorkspace.ОбновитьТокен(ClientID, ClientSecret, RefreshToken); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint google ОбновитьТокен --id %id% --secret %secret% --refresh %refresh%

```


```json title="Результат"



```
