﻿---
sidebar_position: 2
---

# Получить токен
 Получает токен авторизации по логину и паролю



`Функция ПолучитьТокен(Знач Логин, Знач Пароль) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Логин | --login | Строка | Логин пользователя |
  | Пароль | --password | Строка | Пароль пользователя |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Neocities

<br/>

:::tip
Документация Neocities API: [neocities.org/api](https://neocities.org/api)
:::
<br/>


```bsl title="Пример кода"
    Логин  = "2athenaeum";
    Пароль = "Rit...";

    Результат = OPI_Neocities.ПолучитьТокен(Логин, Пароль);
```



```sh title="Пример команды CLI"
    
  oint neocities ПолучитьТокен --login "2athenaeum" --password "Rit..."

```

```json title="Результат"
{
 "result": "success",
 "api_key": "***"
}
```
