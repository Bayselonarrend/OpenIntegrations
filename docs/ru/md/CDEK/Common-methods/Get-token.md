﻿---
sidebar_position: 1
---

# Получить токен
 Получает токен на основе идентификатора аккаунта и пароля



`Функция ПолучитьТокен(Знач Аккаунт, Знач Пароль, ТестовыйAPI = Ложь) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Аккаунт | --account | Строка | Идентификатор клиента (Account) |
  | Пароль | --pass | Строка | Секретный ключ (Password) |
  | ТестовыйAPI | --testapi | Булево | Флаг использования API для тестовых запросов |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от CDEK

<br/>

:::tip
Метод в документации API: [Авторизация клиентов](https://api-docs.cdek.ru/29923918.html)
:::
<br/>


```bsl title="Пример кода"
    Аккаунт = "wqGwiQx0gg8mLtiEKsUinjVSICCjtTEP";
    Пароль  = "RmAmgvSgSl...";

    Результат = OPI_CDEK.ПолучитьТокен(Аккаунт, Пароль, Истина);
```



```sh title="Пример команды CLI"
    
  oint cdek ПолучитьТокен --account "wqGwiQx0gg8mLtiEKsUinjVSICCjtTEP" --pass "RmAmgvSgSl..." --testapi %testapi%

```

```json title="Результат"
{
 "error": "unauthorized",
 "error_description": "Full authentication is required to access this resource"
}
```