---
sidebar_position: 2
---

# Получить токен по коду
 Получает токен по коду из авторизации в бразуере


*Функция ПолучитьТокенПоКоду(Знач ClientID, Знач ClientSecret, Знач Code) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | ClientID | --id | Строка | Client ID |
  | ClientSecret | --secret | Строка | Client secret |
  | Code | --code | Строка | Code из браузера |

  
  Вовзращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

```bsl title="Пример кода"
	

	
```

```sh title="Пример команд CLI"
    
  oint google ПолучитьТокенПоКоду --id %id% --secret %secret% --code %code%

```


```json title="Результат"



```
