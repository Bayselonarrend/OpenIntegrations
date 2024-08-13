---
sidebar_position: 1
---

# Отправить сообщение
 Отправляет сообщение в диалог



`Функция ОтправитьСообщение(Знач URL, Знач IDЧата, Знач Текст, Знач Вложения = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDЧата | --chat | Строка, Число | ID чата (chatXXX) или пользователя (XXX) для диалога |
  | Текст | --text | Строка | Текст сообщения |
  | Вложения | --blocks | Массив из Структура | Массив блоков вложений |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.message.add](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12115)
:::
<br/>


```bsl title="Пример кода"
  URL      = "https://b24-ar17wx.bitrix24.by/rest/1/f2ppp8uucc891111/";
  IDЧата   = "chat" + "450";
  Текст    = "Текст сообщения";
  Картинка = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
  Файл     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";
  
  Вложения = Новый Массив;
  Вложения.Добавить(OPI_Bitrix24.ПолучитьБлокКартинки("Картинка1", Картинка));
  Вложения.Добавить(OPI_Bitrix24.ПолучитьБлокФайла("Файл1.docx"  , Файл));
  
  Результат = OPI_Bitrix24.ОтправитьСообщение(URL, IDЧата, Текст, Вложения);
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "fe3fa966006e9f06006b12e400000001000...";
  IDПользователя = 10;
  
  Результат = OPI_Bitrix24.ОтправитьСообщение(URL, IDПользователя, Текст, , Токен);
```



```sh title="Пример команды CLI"
    
  oint bitrix24 ОтправитьСообщение --url %url% --chat %chat% --text %text% --blocks %blocks% --token %token%

```

```json title="Результат"
{
 "result": 5342,
 "time": {
  "start": 1720969163.89343,
  "finish": 1720969163.95538,
  "duration": 0.061945915222168,
  "processing": 0.0366020202636719,
  "date_start": "2024-07-14T14:59:23+00:00",
  "date_finish": "2024-07-14T14:59:23+00:00",
  "operating_reset_at": 1720969763,
  "operating": 0
 }
}
```
