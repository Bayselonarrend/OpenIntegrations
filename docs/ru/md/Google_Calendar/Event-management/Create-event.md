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
 "etag": "\"3455224619832000\"",
 "id": "p0u9h3a7ouj4kg5682nesifg3o",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=cDB1OWgzYTdvdWo0a2c1NjgybmVzaWZnM28gMjZkMzIxMmM3NDYwYTQ2NDkwMWE1MTEzZDVjMWQ5MmRkZDExZWJlNDQ3MjJmMTBjYTVhNTJlZjdiMGFiNmI3ZUBn",
 "created": "2024-09-29T12:18:29Z",
 "updated": "2024-09-29T12:18:29.916Z",
 "summary": "Новое событие",
 "description": "Описание тестового события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "26d3212c7460a464901a5113d5c1d92ddd11ebe44722f10ca5a52ef7b0ab6b7e@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
 },
 "start": {
  "dateTime": "2024-09-29T18:18:29+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-09-29T19:18:29+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "p0u9h3a7ouj4kg5682nesifg3o@google.com",
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
