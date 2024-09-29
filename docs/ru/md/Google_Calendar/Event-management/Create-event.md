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
    Токен          = "ya29.a0AcM612wLdbBK14FR2SE0d3WHabYb8Xtppm0oKCcbVrecgsA-a5DfsgZ29stOw4hu84F_IpHbKTJocsm1WpjLQPBT5MJ6p8D7H1PKa_iT0...";
    Календарь      = "1b68863d126f9c4d9e971c673e25f6601a9622beafbcc10913cd78120c755c6a@group.calendar.google.com";
    Наименование   = "Новое событие";
    Описание       = "Описание тестового события";
    Час            = 3600;

    Картинка1 = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture.jpg";  // URL, Двоичные или Путь к файлу
    Картинка2 = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/picture2.jpg"; // URL, Двоичные или Путь к файлу
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
