---
sidebar_position: 3
---

# Изменить календарь
 Изменяет свойства существуещего календаря



`Функция ИзменитьМетаданныеКалендаря(Знач Токен, Знач Календарь, Знач Наименование = "", Знач Описание = "") Экспорт`

  | Параметр | CLI опция | Тип | Назначение |
  |-|-|-|-|
  | Токен | --token | Строка | Токен |
  | Календарь | --calendar | Строка | ID календаря |
  | Наименование | --title | Строка | Новое наименование |
  | Описание | --description | Строка | Новое описание календаря |

  
  Возвращаемое значение:   Соответствие Из КлючИЗначение - сериализованный JSON ответа от Google

<br/>




```bsl title="Пример кода"
    Токен        = "ya29.a0AcM612zdAe2M8Ywdxt7xmK1VAAj2m3yjTdP1Ap8cFmqbE8lVngjIAujPtjc_c94MCuKNLfn7MSssBd6NfMXDQDrHMUv7Fgjp7cjuXk68n...";
    Календарь    = "2cd4d2b5dc7a898d4f1d65956b5ccca32841aff4a1603b373ff14db442ac9fab@group.calendar.google.com";
    Наименование = "Новое наименование";
    Описание     = "Новое описание";

    Результат = OPI_GoogleCalendar.ИзменитьМетаданныеКалендаря(Токен, Календарь, Наименование, Описание);
```
    

 <Tabs>
  
    <TabItem value="bash" label="Bash" default>
        ```bash
            oint gcalendar ИзменитьМетаданныеКалендаря --token "***" \
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com" \
              --title "Новое наименование" \
              --description "Новое описание"
        ```
    </TabItem>
  
    <TabItem value="bat" label="CMD/Bat" default>
        ```batch
            oint gcalendar ИзменитьМетаданныеКалендаря ^
              --token "***" ^
              --calendar "f2a98bd1d17474fbd6db370f9759c6ab51d226bdb04aebf6eb683160c8361192@group.calendar.google.com" ^
              --title "Новое наименование" ^
              --description "Новое описание"
        ```
    </TabItem>
</Tabs>


```json title="Результат"
{
 "kind": "calendar#calendar",
 "etag": "\"-qYh74xTwKSw29QLKr4MJFvKBgU\"",
 "id": "cc92fd648db664e3e2fcd62db4c9fd9f458cc49bbc6382560c48f59105aede70@group.calendar.google.com",
 "summary": "Новое наименование",
 "description": "Новое описание",
 "timeZone": "Europe/Moscow",
 "conferenceProperties": {
  "allowedConferenceSolutionTypes": [
   "hangoutsMeet"
  ]
 }
}
```
