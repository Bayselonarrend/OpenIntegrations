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
	

  Ответ = OPI_GoogleWorkspace.ПолучитьТокенПоКоду(ClientID, ClientSecret, Code); //Соответствие
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ); //JSON строка
	
```

```sh title="Пример команд CLI"
    
  oint google ПолучитьТокенПоКоду --id %id% --secret %secret% --code %code%

```


```json title="Результат"



```
