---
sidebar_position: 2
---

# Получить токен
 Получает токен по коду, полученному при авторизации по ссылке из ПолучитьСсылкуАвторизации


*Функция ПолучитьТокен(Знач Код, Знач Параметры = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Код | --code | Строка | Код, полученный из авторизации См.ПолучитьСсылкуАвторизации |
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

```bsl title="Пример кода"
	
  
  Ответ = OPI_Twitter.ПолучитьТокен(Код, Параметры);
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команды CLI"
    
  oint twitter ПолучитьТокен --code %code% --auth %auth%

```


```json title="Результат"

{
  "refresh_token": "TmttM11111111111111111MY2dkNy1EZklLNmxIT1111111111111111xNTg2ODI6MTowOnJ0OjE",
  "access_token": "UTBtWXd11111111111111111111113TkRxWEdxdF9hVlQzOjE3MDUwNTMxNTg2ODE6MTowOmF0OjE",
  "scope": "mute.write tweet.moderate.write block.read follows.read offline.access list.write bookmark.read list.read tweet.write space.read block.write like.write like.read users.read tweet.read bookmark.write mute.read follows.write",
  "expires_in": 7200,
  "token_type": "bearer"
  }

```
