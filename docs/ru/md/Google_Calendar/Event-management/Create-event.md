---
sidebar_position: 4
---

# Создать событие
 Создает новое событие



`Функция СоздатьСобытие(Знач Токен, Знач Календарь, Знач ОписаниеСобытия) Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | ОписаниеСобытия | --props | Соответствие Из КлючИЗначение | Описание события |

  
  Возвращаемое значение:   Строка, Произвольный, HTTPОтвет, ДвоичныеДанные, Неопределено - ответ сервера Google

<br/>




```bsl title="Пример кода"
    ТекущаяДата    = OPI_Инструменты.ПолучитьТекущуюДату();
    Токен          = "ya29.a0AcM612xw6IRwwkQIOEhizd2pJ6LLI4UAhdhxmXDGEzYkcfUPrLYgDDwbsSi5iQdc78WPs_1_Qor5KipuV6mAIvr6z-AKzrBaMT4erIR5T...";
    Календарь      = "e8a267e4a6629e0ef3f8a08ca54f52e2b031d3c40bd27d2866c2ed083c6353ec@group.calendar.google.com";
    Наименование   = "Новое событие";
    Описание       = "Описание тестового события";
    Час            = 3600;

    Картинка1 = "https://openyellow.neocities.org/test_data/picture.jpg";  // URL, Двоичные или Путь к файлу
    Картинка2 = "https://openyellow.neocities.org/test_data/picture2.jpg"; // URL, Двоичные или Путь к файлу
    Вложения  = Новый Соответствие;

    Вложения.Вставить("Картинка1", Картинка1);
    Вложения.Вставить("Картинка2", Картинка2);

    ОписаниеСобытия = Новый Соответствие;
    ОписаниеСобытия.Вставить("Описание"                 , Описание);
    ОписаниеСобытия.Вставить("Заголовок"                , Наименование);
    ОписаниеСобытия.Вставить("МестоПроведения"          , "В офисе");
    ОписаниеСобытия.Вставить("ДатаНачала"               , ТекущаяДата);
    ОписаниеСобытия.Вставить("ДатаОкончания"            , ОписаниеСобытия["ДатаНачала"] + Час);
    ОписаниеСобытия.Вставить("МассивURLФайловВложений"  , Вложения);
    ОписаниеСобытия.Вставить("ОтправлятьУведомления"    , Истина);

    Результат = OPI_GoogleCalendar.СоздатьСобытие(Токен, Календарь, ОписаниеСобытия);
```



```sh title="Пример команды CLI"
    
  oint gcalendar СоздатьСобытие --token %token% --calendar %calendar% --props %props%

```

```json title="Результат"
{
 "kind": "calendar#event",
 "etag": "\"3456563822446000\"",
 "id": "4updfl5oespcksbg2sh53i5u9o",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=NHVwZGZsNW9lc3Bja3NiZzJzaDUzaTV1OW8gM2UxNGUyZTliMTMwMmM3NGZkZTRiZjg5N2RiNGY0YTU1NmEyYzlhOWY5YzlhMmJmOTg4OGEzNGFhNDFiYjFlOUBn",
 "created": "2024-10-07T06:18:31Z",
 "updated": "2024-10-07T06:18:31.223Z",
 "summary": "Новое событие",
 "description": "Описание тестового события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "3e14e2e9b1302c74fde4bf897db4f4a556a2c9a9f9c9a2bf9888a34aa41bb1e9@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-07T12:18:31+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-07T13:18:31+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "4updfl5oespcksbg2sh53i5u9o@google.com",
 "sequence": 0,
 "reminders": {
  "useDefault": true
 },
 "attachments": [
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg",
   "title": "Картинка1",
   "iconLink": ""
  },
  {
   "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg",
   "title": "Картинка2",
   "iconLink": ""
  }
 ],
 "eventType": "default"
}
```
