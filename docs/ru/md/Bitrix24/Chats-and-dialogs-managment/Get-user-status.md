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
  URL = ПараметрыФункции["Bitrix24_URL"];
  
  Результат = OPI_Bitrix24.ПолучитьСтатусПользователя(URL);
  
  
  
  URL             = ПараметрыФункции["Bitrix24_Domain"];
  Токен           = ПараметрыФункции["Bitrix24_Token"];
  
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
