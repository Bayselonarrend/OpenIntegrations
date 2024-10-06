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
 "etag": "\"3456449455936000\"",
 "id": "i54htl9nrvkh96c3l3c1inq5gc",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=aTU0aHRsOW5ydmtoOTZjM2wzYzFpbnE1Z2MgOGJlNDM0YzRhODY4N2I1ZTRjN2UzZGE3N2E3OWMwNGEzYzIwNGNhZTU2NjAxOTMyNWI2MjM2ZGQ3OGM4MmExMkBn",
 "created": "2024-10-06T14:25:27Z",
 "updated": "2024-10-06T14:25:27.968Z",
 "summary": "Новое событие",
 "description": "Описание тестового события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "8be434c4a8687b5e4c7e3da77a79c04a3c204cae566019325b6236dd78c82a12@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-06T20:25:27+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-06T21:25:27+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "i54htl9nrvkh96c3l3c1inq5gc@google.com",
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
