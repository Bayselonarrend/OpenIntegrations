---
sidebar_position: 2
---

# Изменить сообщение
 Изменяет сообщение в диалоге



`Функция ИзменитьСообщение(Знач URL, Знач IDСообщения, Знач Текст = "", Знач Вложения = "", Знач Токен = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | URL | --url | Строка | URL внешнего вебхука или адрес Bitrix24 при использовании токена |
  | IDСообщения | --message | Строка, Число | ID сообщения для изменения |
  | Текст | --text | Строка | Новый текст сообщения |
  | Вложения | --blocks | Массив из Структура | Новый массив блоков вложений |
  | Токен | --token | Строка | Токен авторизации, если используется не вебхук |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Bitrxi24

<br/>

:::tip
Метод в документации API: [im.message.update](https://dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12117)
:::
<br/>


```bsl title="Пример кода"
  URL         = "https://b24-ar17wx.bitrix24.by/rest/1/f2pph8uucc89is6c/";
  IDСообщения = "8682";
  
  Текст    = "Новый текст сообщения";
  
  Результат = OPI_Bitrix24.ИзменитьСообщение(URL, IDСообщения, Текст);
  
  URL            = "b24-ar17wx.bitrix24.by";
  Токен          = "fe3fa966006e9f06006b12e400000001000...";
  IDСообщения    = "8684";
  
  Картинка = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
  Файл     = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";
  
  Вложения = Новый Массив;
  Вложения.Добавить(OPI_Bitrix24.ПолучитьБлокКартинки("Картинка1", Картинка));
  Вложения.Добавить(OPI_Bitrix24.ПолучитьБлокФайла("Файл1.docx"  , Файл));
  
  Результат = OPI_Bitrix24.ИзменитьСообщение(URL, IDСообщения, Текст, Вложения, Токен);
```
	


```sh title="Пример команды CLI"
    
  oint bitrix24 ИзменитьСообщение --url %url% --message %message% --text %text% --blocks %blocks% --token %token%

```

```json title="Результат"
{
 "result": true,
 "time": {
  "start": 1720969165.17314,
  "finish": 1720969165.21621,
  "duration": 0.0430619716644287,
  "processing": 0.018265962600708,
  "date_start": "2024-07-14T14:59:25+00:00",
  "date_finish": "2024-07-14T14:59:25+00:00",
  "operating_reset_at": 1720969765,
  "operating": 0
 }
}
```
