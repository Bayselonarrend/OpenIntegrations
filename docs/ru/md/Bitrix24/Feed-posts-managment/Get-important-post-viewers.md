﻿---
sidebar_position: 4
---

# Получить список просмотревших важное
 Возвращает список пользователей, просмотревших выбранное важное сообщение



`Функция ПолучитьСписокПросмотревшихВажное(Знач URL, Знач IDНовости, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDНовости | --postid | Строка, Число | ID важной новости |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [log.blogpost.getusers.important](https://dev.1c-bitrix.ru/rest_help/log/log_blogpost_getusers_important.php)
:::
<br/>


```bsl title="Пример кода"
    IDНовости = "834";
    URL       = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";

    Результат = OPI_Bitrix24.ПолучитьСписокПросмотревшихВажное(URL, IDНовости);

    URL       = "b24-ar17wx.bitrix24.by";
    Токен     = "37d1fe66006e9f06006b12e400000001000...";

    Результат = OPI_Bitrix24.ПолучитьСписокПросмотревшихВажное(URL, IDНовости, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ПолучитьСписокПросмотревшихВажное --url "b24-ar17wx.bitrix24.by" --postid "122" --token "b9df7366006e9f06006b12e400000001000..."

```

```json title="Результат"
{
 "result": [
  "1"
 ],
 "time": {
  "start": 1728409711.09877,
  "finish": 1728409711.1301,
  "duration": 0.0313289165496826,
  "processing": 0.000207185745239258,
  "date_start": "2024-10-08T20:48:31+03:00",
  "date_finish": "2024-10-08T20:48:31+03:00",
  "operating_reset_at": 1728410311,
  "operating": 0
 }
}
```
