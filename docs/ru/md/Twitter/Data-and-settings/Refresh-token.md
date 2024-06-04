---
sidebar_position: 3
---

# Обновить токен
 Обновляет v2 токен при помощи refresh_token


*Функция ОбновитьТокен(Знач Параметры = "") Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Параметры | --auth | Структура из Строка | JSON авторизации или путь к .json |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Twitter

```bsl title="Пример кода"
	
  
  Ответ = OPI_Twitter.ОбновитьТокен(Параметры);
  Константы.TwitterToken.Установить(Ответ["access_token"]);
  Константы.TwitterRefresh.Установить(Ответ["refresh_token"]);
  
  Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
  

	
```

```sh title="Пример команды CLI"
    
  oint twitter ОбновитьТокен --auth %auth%

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
