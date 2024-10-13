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
    Токен          = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Календарь      = "2cd4d2b5dc7a898d4f1d65956b5ccca32841aff4a1603b373ff14db442ac9fab@group.calendar.google.com";
    Наименование   = "Новое событие";
    Описание       = "Описание тестового события";
    Час            = 3600;

    Картинка1 = "https://api.athenaeum.digital/test_data/picture.jpg";  // URL, Двоичные или Путь к файлу
    Картинка2 = "https://api.athenaeum.digital/test_data/picture2.jpg"; // URL, Двоичные или Путь к файлу
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
 "etag": "\"3456818523024000\"",
 "id": "ukaeqabapn045fr78jnkr0m6dk",
 "status": "confirmed",
 "htmlLink": "https://www.google.com/calendar/event?eid=dWthZXFhYmFwbjA0NWZyNzhqbmtyMG02ZGsgZjhjYjI1MzUxNmNjOTkwZDFmMzZhN2QxNWNkYjgyNWZmZGMxNWM2Y2VlYWEyNWVmNzg5MjRkZTliZWVhM2E1NkBn",
 "created": "2024-10-08T17:41:01Z",
 "updated": "2024-10-08T17:41:01.512Z",
 "summary": "Новое событие",
 "description": "Описание тестового события",
 "location": "В офисе",
 "creator": {
  "email": "bayselonarrend@gmail.com"
 },
 "organizer": {
  "email": "f8cb253516cc990d1f36a7d15cdb825ffdc15c6ceeaa25ef78924de9beea3a56@group.calendar.google.com",
  "displayName": "Тестовый календарь",
  "self": true
 },
 "start": {
  "dateTime": "2024-10-08T23:41:01+03:00",
  "timeZone": "Europe/Moscow"
 },
 "end": {
  "dateTime": "2024-10-09T00:41:01+03:00",
  "timeZone": "Europe/Moscow"
 },
 "iCalUID": "ukaeqabapn045fr78jnkr0m6dk@google.com",
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
