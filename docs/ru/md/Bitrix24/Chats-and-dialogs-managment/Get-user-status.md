---
sidebar_position: 17
---

# Получить статус пользователя
 Получает статус (онлайн) текущего пользователя



`Функция ПолучитьСтатусПользователя(Знач URL, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.user.status.get](https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11497)
:::
<br/>


```bsl title="Пример кода"
    URL = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСтатусПользователя(URL);

    URL             = "b24-ar17wx.bitrix24.by";
    Токен           = "6476c766006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСтатусПользователя(URL, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСтатусПользователя --url %url% --token %token%

```

```json title="Результат"
{
 "error": "expired_token",
 "error_description": "The access token provided has expired."
}
```
