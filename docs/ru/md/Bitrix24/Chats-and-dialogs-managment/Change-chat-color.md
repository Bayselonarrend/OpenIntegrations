---
sidebar_position: 8
---

# Изменить цвет чата
 Изменяет цвет чата для мобильного приложения



`Функция ИзменитьЦветЧата(Знач URL, Знач IDЧата, Знач Цвет, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата |
  | Цвет | --color | Строка | Новый цвет чата |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.chat.updateTitle](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12105)

 Доступные цвета: RED, GREEN, MINT, LIGHT_BLUE, DARK_BLUE, PURPLE, AQUA, PINK, LIME, BROWN, AZURE, KHAKI, SAND, MARENGO, GRAY, GRAPHITE
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/1o2...";
    IDЧата  = "872";

    Цвет    = "AZURE";

    Результат = OPI_Bitrix24.ИзменитьЦветЧата(URL, IDЧата, Цвет);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "37d1fe66006e9f06006b12e400000001000...";

    Цвет           = "PURPLE";

    Результат = OPI_Bitrix24.ИзменитьЦветЧата(URL, IDЧата, Цвет, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьЦветЧата --url %url% --chat %chat% --color %color% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1728326868.74518,
  "finish": 1728326868.81597,
  "duration": 0.0707910060882568,
  "processing": 0.0450060367584228,
  "date_start": "2024-10-07T21:47:48+03:00",
  "date_finish": "2024-10-07T21:47:48+03:00",
  "operating_reset_at": 1728327468,
  "operating": 0
 }
}
```
