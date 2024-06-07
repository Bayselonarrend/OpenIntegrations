---
sidebar_position: 4
---

# Создать событие
 Создает новое событие


*Функция СоздатьСобытие(Знач Токен, Знач Календарь, Знач ОписаниеСобытия) Экспорт*

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | ОписаниеСобытия | --props | Соответствие Из КлючИЗначение | Описание события |

  
  Возвращаемое значение:   Строка, Произвольный, HTTPОтвет, ДвоичныеДанные, Неопределено - ответ сервера Google

```bsl title="Пример кода"
	
      
      Вложения        = Новый Соответствие;
      Вложения.Вставить("Картинка1", "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png");
      Вложения.Вставить("Картинка2", "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1");
      
      СоответствиеСобытия = Новый Соответствие;
      СоответствиеСобытия.Вставить("Описание"                 , Описание);
      СоответствиеСобытия.Вставить("Заголовок"                , Наименование);
      СоответствиеСобытия.Вставить("МестоПроведения"          , "В оффисе");
      СоответствиеСобытия.Вставить("ДатаНачала"               , ТекущаяДатаСеанса());
      СоответствиеСобытия.Вставить("ДатаОкончания"            , СоответствиеСобытия["ДатаНачала"] + 3600);
      СоответствиеСобытия.Вставить("МассивURLФайловВложений"  , Вложения);
      СоответствиеСобытия.Вставить("ОтправлятьУведомления"    , Истина);
      
      Ответ = OPI_GoogleCalendar.СоздатьСобытие(Токен, Календарь, СоответствиеСобытия);
      Ответ = OPI_Инструменты.JSONСтрокой(Ответ);
      
    
	
```

```sh title="Пример команды CLI"
    
      oint gcalendar СоздатьСобытие --token %token% --calendar %calendar% --props %props%


```


```json title="Результат"

{
  "eventType": "default",
  "attachments": [
  {
  "iconLink": "",
  "title": "Картинка2",
  "fileUrl": "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/Media/logo.png?v1"
  },
  {
  "iconLink": "",
  "title": "Картинка1",
  "fileUrl": "https://opi.neocities.org/assets/images/logo_long-e8fdcca6ff8b32e679ea49a1ccdd3eac.png"
  }
  ],
  "reminders": {
  "useDefault": true
  },
  "sequence": 0,
  "start": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-21T15:16:25+03:00"
  },
  "creator": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "end": {
  "timeZone": "Europe/Minsk",
  "dateTime": "2024-02-21T16:16:25+03:00"
  },
  "iCalUID": "j4nonfcc0m2mtop1vc8ivo8tb8@google.com",
  "description": "Описание тестового события",
  "updated": "2024-02-21T09:16:28.474Z",
  "created": "2024-02-21T09:16:28.000Z",
  "htmlLink": "https://www.google.com/calendar/event?eid=ajRub25mY2MwbTJtdG9wMXZjOGl2bzh0YjggYmF5c2Vsb25hcnJlbmRAbQ",
  "location": "В оффисе",
  "summary": "Новое событие",
  "organizer": {
  "self": true,
  "email": "bayselonarrend@gmail.com"
  },
  "status": "confirmed",
  "id": "j4nonfcc0m2mtop1vc8ivo8tb8",
  "etag": "\"3417013976948000\"",
  "kind": "calendar#event"
  }

```
