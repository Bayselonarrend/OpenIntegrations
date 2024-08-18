---
sidebar_position: 9
---

# Изменить картинку чата
 Устанавливает новую картинку чата



`Функция ИзменитьКартинкуЧата(Знач URL, Знач IDЧата, Знач Картинка, Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата |
  | Картинка | --picture | Строка, ДвоичныеДанные | Данные файла картинки |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.chat.updateAvatar](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12109)
:::
<br/>


```bsl title="Пример кода"
    URL     = "https://b24-ar17wx.bitrix24.by/rest/1/ztbe...";
    IDЧата  = "454";

    Картинка = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg";

    Результат = OPI_Bitrix24.ИзменитьКартинкуЧата(URL, IDЧата, Картинка);

    URL            = "b24-ar17wx.bitrix24.by";
    Токен          = "c03fa966006e9f06006b12e400000001000...";
    IDЧата         = "456";

    Результат = OPI_Bitrix24.ИзменитьКартинкуЧата(URL, IDЧата, Картинка, Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьКартинкуЧата --url %url% --chat %chat% --picture %picture% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1720865692.90718,
  "finish": 1720865693.81896,
  "duration": 0.91178297996521,
  "processing": 0.884725093841553,
  "date_start": "2024-07-13T10:14:52+00:00",
  "date_finish": "2024-07-13T10:14:53+00:00",
  "operating_reset_at": 1720866292,
  "operating": 0.884703874588013
 }
}
```
